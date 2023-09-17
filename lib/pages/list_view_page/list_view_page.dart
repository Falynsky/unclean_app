import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/bloc/list_view_bloc/list_view_bloc.dart';
import 'package:unclean_app/bloc/list_view_bloc/list_view_event.dart';
import 'package:unclean_app/bloc/list_view_bloc/list_view_state.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';
import 'package:unclean_app/pages/list_view_page/list_view_card_list.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  late NavigationCubit navigationCubit;
  late final TransactionsBloc transactionsBloc;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
    transactionsBloc = TransactionsBloc();
    scrollController.addListener(() {
      final ScrollPosition position = scrollController.position;
      if (position.atEdge && position.pixels == position.maxScrollExtent && !position.outOfRange) {
        StopwatchUtils().stop(key: 'jump_timer_down');
      } else if (position.atEdge && position.pixels == position.minScrollExtent && !position.outOfRange) {
        StopwatchUtils().stop(key: 'jump_timer_up');
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'transaction_page_draw');
    });
  }

  void _onPressed() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'jump_draw');
    });
    StopwatchUtils().start(key: 'jump_draw', description: 'Time to render jump:');
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      StopwatchUtils().start(key: 'jump_timer_up', description: 'Time to jump up:');
      scrollController.jumpTo(scrollController.position.minScrollExtent);
    } else {
      StopwatchUtils().start(key: 'jump_timer_down', description: 'Time to jump down:');
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    StopwatchUtils().start(key: 'transaction_page_draw');
    StopwatchUtils().start(key: 'transaction_page');
    final Widget widget = Scaffold(
      appBar: AppBar(
        title: const Text('ListView Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        splashColor: Colors.red,
        child: const Icon(Icons.slow_motion_video),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: BlocProvider<TransactionsBloc>(
          create: (BuildContext context) => transactionsBloc,
          child: BlocBuilder<TransactionsBloc, TransactionsState>(
            bloc: transactionsBloc,
            builder: (BuildContext context, TransactionsState state) {
              if (state is TransactionsInitial) {
                transactionsBloc.add(LoadTransactionsEvent());
              } else if (state is TransactionsLoadedState) {
                return ListViewCardList(scrollController: scrollController);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
    StopwatchUtils().stop(key: 'transaction_page');
    return widget;
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
