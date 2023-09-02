import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';
import 'package:unclean_app/pages/stateful_widget_page/first_stateful_widget.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

class SatefulWidgetPage extends StatefulWidget {
  const SatefulWidgetPage({
    super.key,
  });

  @override
  State<SatefulWidgetPage> createState() => _SatefulWidgetPageState();
}

class _SatefulWidgetPageState extends State<SatefulWidgetPage> {
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start();
    final Widget widget = Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ColoredBox(
                color: Colors.amberAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 80,
                      child: Center(
                        child: Text(
                          'To jest główny StatefulWidget',
                        ),
                      ),
                    ),
                    FirstStatefulWidget()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    stopwatchUtils..stop();
    return widget;
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
