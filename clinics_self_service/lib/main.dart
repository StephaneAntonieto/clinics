import 'package:clinics_core/clinics_core.dart';
import 'package:clinics_self_service/src/binding/clinics_application_binding.dart';
import 'package:clinics_self_service/src/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runApp(const ClinicsSelfServiceApp());
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
    );
  }
}
