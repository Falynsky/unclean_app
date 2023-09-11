import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

void main() {
  final List<int> list = [];

  setUp(() {
    list.addAll(List<int>.generate(3000000, (int index) => index));
  });

  test('while loop', () {
    StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'while loop');
    var count = 0;
    num eachElement = 0;
    while (count < list.length) {
      eachElement = pow(list[count], 3);
      count++;
    }

    stopwatchUtils..stop(key: 'test');
  });

  test('while loop cashed length', () {
    StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'while loop cashed length');
    var count = 0;
    num eachElement = 0;
    var length = list.length;
    while (count < length) {
      eachElement = pow(list[count], 3);
      count++;
    }

    stopwatchUtils..stop(key: 'test');
  });

  test('for loop cached length', () {
    StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'for loop cached length');

    num eachElement = 0;
    var length = list.length;
    for (var i = 0; i < length; i++) {
      eachElement = pow(list[i], 3);
    }
    stopwatchUtils..stop(key: 'test');
  });

  test('for loop', () {
    StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'for loop');

    num eachElement = 0;
    for (var i = 0; i < list.length; i++) {
      eachElement = pow(list[i], 3);
    }
    stopwatchUtils..stop(key: 'test');
  });

  test('while loop cashed length reversed order', () {
    StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'while loop cashed length reversed order');
    var count = list.length - 1;
    num eachElement = 0;
    while (count >= 0) {
      eachElement = pow(list[count], 3);
      count--;
    }

    stopwatchUtils..stop(key: 'test');
  });

  test('forEach loop', () {
    StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'forEach loop');

    num eachElement = 0;
    list.forEach((element) {
      eachElement = pow(element, 3);
    });
    stopwatchUtils..stop(key: 'test');
  });

  test('fo..in loop', () {
    StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'fo..in loop');

    num eachElement = 0;
    for (var element in list) {
      eachElement = pow(element, 3);
    }
    stopwatchUtils..stop(key: 'test');
  });

  test('map loop', () {
    StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start(key: 'test', description: 'map loop');
    num eachElement = 0;
    list.map((e) {
      eachElement = pow(e, 3);
    }).toList();

    stopwatchUtils..stop(key: 'test');
  });
}
