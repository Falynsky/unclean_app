import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_state.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';
import 'package:unclean_app/pages/bloc_builder/bloc_builder_page.dart';
import 'package:unclean_app/pages/container_page/container_page.dart';
import 'package:unclean_app/pages/home_page/home_page.dart';
import 'package:unclean_app/pages/just_stateful_widget_page/just_stateful_widget_page.dart';
import 'package:unclean_app/pages/just_stateful_widget_page_2/just_stateful_widget_page_2.dart';
import 'package:unclean_app/pages/list_view_page/list_view_page.dart';
import 'package:unclean_app/pages/paddings_page/paddings_page.dart';
import 'package:unclean_app/pages/stateful_widget_page/stateful_widget_page.dart';

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
          if (state.currentScreen == NavigationScreens.home) {
            return const HomePage();
          } else if (state.currentScreen == NavigationScreens.listView) {
            return const ListViewPage();
          } else if (state.currentScreen == NavigationScreens.statefulWidget) {
            return const StatefulWidgetPage();
          } else if (state.currentScreen == NavigationScreens.blocBuilder) {
            return const BlocBuilderPage();
          } else if (state.currentScreen == NavigationScreens.container) {
            return ContainerPage();
          } else if (state.currentScreen == NavigationScreens.paddings) {
            return PaddingsPage();
          } else if (state.currentScreen == NavigationScreens.justStatefulWidget) {
            return const JustStatefulWidgetPage();
          } else if (state.currentScreen == NavigationScreens.justStatefulWidget2) {
            return const JustStatefulWidgetPage2();
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
