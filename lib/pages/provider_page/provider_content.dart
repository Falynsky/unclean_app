import 'package:flutter/material.dart';
import 'package:unclean_app/pages/provider_page/test_provider.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

class ProviderContent extends StatelessWidget {
  final WillPopCallback onWillPop;
  final TestProvider provider;

  const ProviderContent(this.onWillPop, this.provider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('provider_page'),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                const Text('Naciśnij przycisk aby wyświetlić obecną godzinę'),
                ElevatedButton(
                  onPressed: () {
                    StopwatchUtils().start(key: 'provider_page');
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      StopwatchUtils().stop(key: 'provider_page');
                    });
                    provider.getCurrentDateTime();
                  },
                  child: const Text('Pokaż godzinę'),
                ),
                Text(provider.currentTime),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
