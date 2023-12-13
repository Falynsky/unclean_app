import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

class PaddingsPage extends StatefulWidget {
  @override
  State<PaddingsPage> createState() => _PaddingsPageState();
}

class _PaddingsPageState extends State<PaddingsPage> {
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'paddings_page_draw');
    });
  }

  @override
  Widget build(BuildContext context) {
    StopwatchUtils().start(key: 'paddings_page_draw');
    StopwatchUtils().start(key: 'paddings_page');
    final Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: const Text('Paddings'),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              for (int i = 0; i < 10000; i++)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('test'),
                ),
            ],
          ),
        ),
      ),
    );
    StopwatchUtils().stop(key: 'paddings_page');
    return scaffold;
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
