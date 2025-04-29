import 'package:clinics_core/clinics_core.dart';
import 'package:clinics_self_service/src/core/env.dart';
import 'package:flutter_getit/flutter_getit.dart';

class ClinicsApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
    Bind.lazySingleton<RestClient>((i) => RestClient(Env.backendBaseUrl)),
  ];
}
