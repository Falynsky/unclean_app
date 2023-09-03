class WidgetBuildCounterUtils {
  final String _description;
  final String _key;

  static final Map<String, int> _cache = <String, int>{};

  factory WidgetBuildCounterUtils({String? key, String? description}) {
    return _instance ??= WidgetBuildCounterUtils._internal(key: key ?? 'test', description: description);
  }

  WidgetBuildCounterUtils._internal({required String key, String? description})
      : _key = key,
        _description = description ?? 'widget built:';

  static WidgetBuildCounterUtils? _instance;

  void add() {
    _cache[_key] = (_cache[_key] ?? 0) + 1;
  }

  void stop() {
    final int builds =_cache.remove(_key)!;
    print('$_description $builds times');
  }
}
