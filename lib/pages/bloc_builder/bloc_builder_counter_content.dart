import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/bloc/bloc_builder_bloc/bloc_builder_bloc.dart';
import 'package:unclean_app/bloc/bloc_builder_bloc/bloc_builder_event.dart';
import 'package:unclean_app/pages/bloc_builder/bloc_builder_text.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';
import 'package:unclean_app/utils/widget_build_counter_utils.dart';

class BlocBuilderCounterContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BlocBuilderCounterContentState();
}

class _BlocBuilderCounterContentState extends State<BlocBuilderCounterContent> {
  late final BlocBuilderBloc blocBuilderBloc;

  @override
  void initState() {
    super.initState();
    blocBuilderBloc = context.read<BlocBuilderBloc>();
    StopwatchUtils().start(key: 'bloc_builder_counter_content_draw');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'bloc_builder_counter_content_draw');
    });
  }

  @override
  Widget build(BuildContext context) {
    StopwatchUtils().start(key: 'bloc_builder_counter_content');
    final Container container = Container(
      child: Column(
        children: <Widget>[
          ButtonBar(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  blocBuilderBloc.add(StartTimer());
                },
                child: const Text('Włącz stoper'),
              ),
              ElevatedButton(
                onPressed: () {
                  StopwatchUtils().start(key: 'bloc_builder_counter_content_draw');
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    StopwatchUtils().stop(key: 'bloc_builder_counter_content_draw');
                  });
                  blocBuilderBloc.add(StopTimer());
                },
                child: const Text('Wyłącz stoper i wyswietl'),
              ),
              ElevatedButton(
                onPressed: () {
                  blocBuilderBloc.add(ResetTimer());
                  WidgetBuildCounterUtils().stop(key: 'bloc_builder_text');
                },
                child: const Text('Reset'),
              ),
            ],
          ),
          BlocBuilderText(),
        ],
      ),
    );
    StopwatchUtils().stop(key: 'bloc_builder_counter_content');
    return container;
  }
}
