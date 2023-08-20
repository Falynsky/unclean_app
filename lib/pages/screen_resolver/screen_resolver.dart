import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_state.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';
import 'package:unclean_app/pages/home_page/home_page.dart';
import 'package:unclean_app/pages/login_page/login_page.dart';
import 'package:unclean_app/pages/transactions_page/transactions_page.dart';

class ScreenResolver extends StatefulWidget {
  const ScreenResolver({Key? key}) : super(key: key);

  @override
  State<ScreenResolver> createState() => _ScreenResolverState();
}

class _ScreenResolverState extends State<ScreenResolver> {
  late final NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = NavigationCubit();
  }

  @override
  void dispose() {
    super.dispose();
    navigationCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (_) => navigationCubit,
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (BuildContext context, NavigationState state) {
          if (state.currentScreen == NavigationScreens.login) {
            return LoginPage();
          } else if (state.currentScreen == NavigationScreens.home) {
            return HomePage();
          } else if (state.currentScreen == NavigationScreens.transactions) {
            return TransactionPage();
          } else {
            return InkWell(
              onTap: () => navigationCubit.navigate(NavigationScreens.home),
              child: ColoredBox(
                color: Colors.red,
                child: Text(NavigationScreens.values.toString()),
              ),
            );
          }
        },
      ),
    );
  }
}
