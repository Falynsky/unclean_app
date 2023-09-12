import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:unclean_app/bloc/transactions_bloc/transactions_event.dart';
import 'package:unclean_app/bloc/transactions_bloc/transactions_state.dart';
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
  late final StopwatchUtils scrollToBottomStopwatchUtils;
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
    transactionsBloc = TransactionsBloc();
    scrollToBottomStopwatchUtils = StopwatchUtils();
    scrollController.addListener(() {
      if (scrollController.offset >= scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        scrollToBottomStopwatchUtils.stop(key: 'scroll_timer');
      } else {
        scrollToBottomStopwatchUtils.stop(key: 'scroll_timer');
      }
    });
  }

  void _onPressed() async {
    //if on botton jump to top else jump to bottom
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      scrollToBottomStopwatchUtils.start(key: 'scroll_timer', description: 'Time to scroll :');
      scrollController.jumpTo(
        scrollController.position.minScrollExtent,
      );
    } else {
      scrollToBottomStopwatchUtils.start(key: 'scroll_timer', description: 'Time to scroll :');
      scrollController.jumpTo(
        scrollController.position.maxScrollExtent,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'transaction_page_draw');
    stopwatchUtils..start(key: 'transaction_page');
    final Widget widget = Scaffold(
      appBar:  AppBar(
        title: Text('ListView Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        splashColor: Colors.red,
        child: const Icon(Icons.slow_motion_video),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: BlocProvider(
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
    stopwatchUtils..stop(key: 'transaction_page');
    return widget;
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
