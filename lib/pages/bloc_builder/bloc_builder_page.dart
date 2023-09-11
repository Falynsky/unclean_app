import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/bloc/bloc_builder_bloc/bloc_builder_bloc.dart';
import 'package:unclean_app/bloc/bloc_builder_bloc/bloc_builder_event.dart';
import 'package:unclean_app/bloc/bloc_builder_bloc/bloc_builder_state.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';

class BlocBuilderPage extends StatefulWidget {
  const BlocBuilderPage();

  @override
  State<BlocBuilderPage> createState() => _BlocBuilderPageState();
}

class _BlocBuilderPageState extends State<BlocBuilderPage> {
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();

    navigationCubit = context.read<NavigationCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final BlocBuilderBloc blocBuilderBloc = BlocBuilderBloc(InBlocBuilderState('start'));
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Builder Page'),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: BlocBuilder<BlocBuilderBloc, BlocBuilderState>(
          bloc: blocBuilderBloc,
          builder: (BuildContext context, BlocBuilderState state) {
            return Container(
              child: Column(
                children: [
                  ButtonBar(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          blocBuilderBloc.add(InitBlocBuilder());
                        },
                        child: Text('Init'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          blocBuilderBloc.add(ResetBlocBuilder());
                        },
                        child: Text('Reset'),
                      ),
                    ],
                  ),
                  Text(
                    state.toString(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
