import 'package:clinics_core/clinics_core.dart';
import 'package:clinics_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SelfServicePage extends StatefulWidget {
  const SelfServicePage({super.key});

  @override
  State<SelfServicePage> createState() => _SelfServicePageState();
}

class _SelfServicePageState extends State<SelfServicePage>
    with MessageViewMixin {
  final controller = Injector.get<SelfServiceController>();

  @override
  void initState() {
    messageListener(controller);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.startProcess();
      effect(() {
        var baseRoute = '/self-service/';
        final step = controller.step;

        switch (step) {
          case FormSteps.none:
            return;
          case FormSteps.whoIAm:
            baseRoute += 'whoIAm';
          case FormSteps.findPatient:
            baseRoute += 'find-patient';
          case FormSteps.patient:
            baseRoute += 'patient';
          case FormSteps.documents:
            baseRoute += 'documents';
          case FormSteps.done:
            baseRoute += 'done';
          case FormSteps.restart:
            return;
        }
        Navigator.of(context).pushNamed(baseRoute);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
