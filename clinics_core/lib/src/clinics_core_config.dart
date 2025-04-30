import 'package:clinics_core/src/theme/clinics_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter/foundation.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:clinics_core/src/loader/clinics_loader.dart';

class ClinicsCoreConfig extends StatelessWidget {
  const ClinicsCoreConfig({
    super.key,
    this.binding,
    this.pages,
    this.pagesBuilders,
    this.modules,
    required this.title,
  });

  final ApplicationBindings? binding;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilders;
  final List<FlutterGetItModule>? modules;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: kDebugMode,
      bindings: binding,
      pages: [...pages ?? [], ...pagesBuilders ?? []],
      modules: modules,
      builder: (context, routes, flutterGetItNavObserver) {
        return AsyncStateBuilder(
          loader: ClinicsLoader(),
          builder: (navigatorObserver) {
            return MaterialApp(
              theme: ClinicsTheme.lightTheme,
              darkTheme: ClinicsTheme.dartTheme,
              navigatorObservers: [navigatorObserver, flutterGetItNavObserver],
              routes: routes,
              title: title,
            );
          },
        );
      },
    );
  }
}
