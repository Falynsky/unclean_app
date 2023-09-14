import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unclean_app/pages/provider_page/provider_content.dart';
import 'package:unclean_app/pages/provider_page/test_provider.dart';

class ProviderConsumerPage extends StatelessWidget {
  final WillPopCallback onWillPop;

  const ProviderConsumerPage({required this.onWillPop});

  @override
  Widget build(BuildContext context) {
    return Consumer<TestProvider>(
      builder: (BuildContext context, TestProvider provider, Widget? child) {
        return ProviderContent(onWillPop, provider);
      },
    );
  }
}
