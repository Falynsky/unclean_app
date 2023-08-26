class StopwatchUtils {
  final Stopwatch _stopwatch = Stopwatch();
  final String _description;

  StopwatchUtils({String? description}) : _description = description ?? 'Time to build widget:';
  void start() {
    _stopwatch.start();
  }

  void stop() {
    _stopwatch.stop();
    final int elapsedMilliseconds = _stopwatch.elapsedMilliseconds;
    final int elapsedMicroseconds = _stopwatch.elapsedMicroseconds;
    print('$_description $elapsedMilliseconds ms / $elapsedMicroseconds μs');
  }
}
