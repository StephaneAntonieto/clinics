import 'dart:async';
import 'dart:developer';

import 'package:clinics_self_service/src/modules/home/home_module.dart';
import 'package:clinics_self_service/src/modules/self_service/self_service_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:clinics_core/clinics_core.dart';
import 'package:clinics_self_service/src/binding/clinics_application_binding.dart';
import 'package:clinics_self_service/src/modules/auth/auth_module.dart';
import 'package:clinics_self_service/src/pages/splash_page/splash_page.dart';

void main() {
  runZonedGuarded(() => {runApp(const ClinicsSelfServiceApp())}, (
    error,
    stack,
  ) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class ClinicsSelfServiceApp extends StatelessWidget {
  const ClinicsSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ClinicsCoreConfig(
      title: 'Lab Clinics Self Service',
      binding: ClinicsApplicationBinding(),
      pagesBuilders: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: '/'),
      ],
      modules: [AuthModule(), HomeModule(), SelfServiceModule()],
    );
  }
}
