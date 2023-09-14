import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';
import 'package:unclean_app/pages/provider_page/provider_consumer_page.dart';
import 'package:unclean_app/pages/provider_page/test_provider.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  late String currentTime;
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
    currentTime = DateTime.now().toString();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StopwatchUtils().stop(key: 'provider_page_first_execute');
    });
  }

  @override
  Widget build(BuildContext context) {
    StopwatchUtils().start(key: 'provider_page_first_execute');
    return ChangeNotifierProvider<TestProvider>(
      create: (_) => TestProvider(),
      child: ProviderConsumerPage(
        onWillPop: onWillPop,
      ),
    );
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}
