import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';
import 'package:unclean_app/pages/stateful_widget_page/first_stateful_widget.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

class StatefulWidgetPage extends StatefulWidget {
  const StatefulWidgetPage({
    super.key,
  });

  @override
  State<StatefulWidgetPage> createState() => _StatefulWidgetPageState();
}

class _StatefulWidgetPageState extends State<StatefulWidgetPage> {
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'stateful_widget_page_draw');
    });
  }

  @override
  Widget build(BuildContext context) {
    StopwatchUtils().start(key: 'stateful_widget_page');
    StopwatchUtils().start(key: 'stateful_widget_page_draw');
    final Widget widget = Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget Page'),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ColoredBox(
                color: Colors.amberAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(
                      height: 80,
                      child: Center(
                        child: Text(
                          'To jest główny StatefulWidget',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: const Text(
                              'static progess : ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Container(
                                child: const LinearProgressIndicator(
                                  value: 0.25,
                                  backgroundColor: Colors.grey,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FirstStatefulWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    StopwatchUtils().stop(key: 'stateful_widget_page');
    return widget;
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
