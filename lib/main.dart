import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'gen/fonts.gen.dart';
import 'l10n/gen/app_localizations.dart';
import 'presentation/router/app_router.dart';
import 'presentation/theme/theme_manager.dart';
import 'service/dependency_manager.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton(DependencyManager()).initialize();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const Application());
  FlutterNativeSplash.remove();
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return MaterialApp.router(
            theme: FlexThemeData.light(
              scheme: FlexScheme.blue,
              fontFamily: FontFamily.openSans,
            ),
            darkTheme: FlexThemeData.dark(scheme: FlexScheme.blue),
            themeMode: ref.watch(themeProvider).value,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: AppRouter.routerConfig,
          );
        },
      ),
    );
  }
}
