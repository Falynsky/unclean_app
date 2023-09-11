import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

void main() {
  final List<String> bigItems = [];

  setUp(() {
    bigItems.addAll(List<String>.generate(1000, (int index) => 'Item $index'));
  });

  testWidgets('ListView should display items', (WidgetTester tester) async {
    StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'ListView should display items');
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView(
          children: bigItems.map((i) => Container(child: Text(i))).toList(),
        ),
      ),
    ));
    stopwatchUtils..stop(key: 'test');

    // Find the text widgets
    final textFinders = find.byType(Text);
    print('found ${textFinders.evaluate().length} widgets');
  });

  testWidgets('ListView.builder should display items', (WidgetTester tester) async {
    StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'ListView.builder should display items');
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: bigItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(child: Text(bigItems[index]));
          },
        ),
      ),
    ));
    stopwatchUtils..stop(key: 'test');

    // Find the text widgets
    final textFinders = find.byType(Text);

    print('found ${textFinders.evaluate().length} widgets');
    // Verify that the text widgets are displayed
  });
}
