class StopwatchUtils {
  final Stopwatch _stopwatch = Stopwatch();

  void start() {
    _stopwatch.start();
  }

  void stop() {
    _stopwatch.stop();
    final int elapsedMilliseconds = _stopwatch.elapsedMilliseconds;
    final int elapsedMicroseconds = _stopwatch.elapsedMicroseconds;
    print('Time to build widget: $elapsedMilliseconds ms / $elapsedMicroseconds μs');
  }
}
