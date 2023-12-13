import 'package:flutter_test/flutter_test.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

// ignore_for_file: unused_local_variable
void main() {
  final StopwatchUtils stopwatchUtils = StopwatchUtils();
  test('dynamic list of 2 maps', () {
    final List<dynamic> list = <dynamic>[
      <dynamic, dynamic>{'key_1': 123},
      <dynamic, dynamic>{'key_2': 234}
    ];

    stopwatchUtils.start(key: 'dynamic list of 2 maps');
    final dynamic length = list.length;
    final dynamic last = list.last;
    stopwatchUtils.stop(key: 'dynamic list of 2 maps');
  });

  test('list of 2 maps', () {
    final List<Map<String, int>> list = <Map<String, int>>[
      <String, int>{'key_1': 123},
      <String, int>{'key_2': 234}
    ];

    stopwatchUtils.start(key: 'list of 2 maps');
    final int length = list.length;
    final Map<String, int> last = list.last;
    stopwatchUtils.stop(key: 'list of 2 maps');
  });

    test('dynamic list of 100 maps', () {
    final List<dynamic> list = <dynamic>[
      for(int i = 1; i <= 100; i++)
      <dynamic, dynamic>{'key_$i' : i}
    ];

    stopwatchUtils.start(key: 'dynamic list of 100 maps');
    final dynamic length = list.length;
    final dynamic last = list.last;
    stopwatchUtils.stop(key: 'dynamic list of 100 maps');
  });

  test('list of 100 maps', () {
    final List<Map<String, int>> list = <Map<String, int>>[
   for(int i = 1; i <= 100; i++)
      <String, int>{'key_$i': i}
    ];

    stopwatchUtils.start(key: 'list of 100 maps');
    final int length = list.length;
    final Map<String, int> last = list.last;
    stopwatchUtils.stop(key: 'list of 100 maps');
  });
}
