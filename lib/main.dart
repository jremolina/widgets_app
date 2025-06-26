import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/routes/route_config.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool isdarkMode = ref.watch(isDarkModeProvider);
    final int selectedcolor = ref.watch(selectedindexcolorprovider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      theme: AppTheme(selectedColor: selectedcolor, isdarkMode: isdarkMode)
          .getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
