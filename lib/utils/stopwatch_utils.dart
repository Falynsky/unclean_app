class StopwatchUtils {
  final String _description;
  final String _key;

  static final Map<String, Stopwatch> _cache = <String, Stopwatch>{};

  factory StopwatchUtils({String? key, String? description}) {
    return _instance ??= StopwatchUtils._internal(key: key ?? 'test', description: description);
  }

  StopwatchUtils._internal({required String key, String? description})
      : _key = key,
        _description = description ?? 'Time to build widget:';

  static StopwatchUtils? _instance;

  void start() {
    _cache[_key] = Stopwatch()..start();
  }

  void stop() {
    final Stopwatch stopwatch =_cache.remove(_key)!;
    final int elapsedMilliseconds = stopwatch.elapsedMilliseconds;
    final int elapsedMicroseconds = stopwatch.elapsedMicroseconds;
    print('$_description $elapsedMilliseconds ms / $elapsedMicroseconds μs');
  }
}
