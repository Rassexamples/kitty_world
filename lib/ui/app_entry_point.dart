import 'package:flutter/material.dart';
import 'package:kitty_world/resources/general_theme.dart';
import 'package:kitty_world/ui/detail_screen/detail_screen.dart';
import 'package:kitty_world/ui/main_screen/main_screen.dart';
import 'package:kitty_world/ui/shared_elements/router.dart';



class AppEntryPoint extends StatelessWidget {
  ///
  /// The entry point for the app
  ///
  /// It configures the routes and theme by using [KittyAppRoutes] and [AppTheme],
  ///
  const AppEntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.generalTheme,
      initialRoute: KittyAppRoutes.HOME,
      routes: {
        KittyAppRoutes.HOME: (context) =>  const MainScreen(),
        KittyAppRoutes.DETAIL_SCREEN: (context) => const DetailsScreen(),
      },
    );
  }
}
