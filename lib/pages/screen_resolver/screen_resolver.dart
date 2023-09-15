import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_state.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';
import 'package:unclean_app/pages/bloc_builder/bloc_builder_page.dart';
import 'package:unclean_app/pages/home_page/home_page.dart';
import 'package:unclean_app/pages/justStatefulWidgetPage/just_stateful_widget_page.dart';
import 'package:unclean_app/pages/list_view_page/list_view_page.dart';
import 'package:unclean_app/pages/sized_box_page/sized_box_page.dart';
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
            return const SatefulWidgetPage();
          } else if (state.currentScreen == NavigationScreens.blocBuilder) {
            return const BlocBuilderPage();
          } else if (state.currentScreen == NavigationScreens.sizedBox) {
            return SizedBoxPage();
          } else if (state.currentScreen == NavigationScreens.justStatefulWidget) {
            return const JustStatefulWidgetPage();
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
