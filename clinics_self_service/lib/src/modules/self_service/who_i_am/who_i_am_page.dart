import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:clinics_core/clinics_core.dart';
import 'package:clinics_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validatorless/validatorless.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});

  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> {
  final selfServiceController = Injector.get<SelfServiceController>();
  final formKey = GlobalKey<FormState>();
  final firstNameEC = TextEditingController();
  final lastNameEC = TextEditingController();

  @override
  void dispose() {
    firstNameEC.dispose();
    lastNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        firstNameEC.text = '';
        lastNameEC.text = '';
        selfServiceController.clearForm();
      },
      child: Scaffold(
        appBar: ClinicsAppBar(
          actions: [
            PopupMenuButton(
              child: const IconPopupMenuWidget(),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Finalizar Terminal'),
                  ),
                ];
              },
              onSelected: (value) async {
                if (value == 1) {
                  final nav = Navigator.of(context);
                  await SharedPreferences.getInstance().then(
                    (sp) => sp.clear(),
                  );
                  nav.pushNamedAndRemoveUntil('/', (route) => false);
                }
              },
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (_, constrains) {
            return SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(minHeight: constrains.maxHeight),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background_login.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    width: sizeOf.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Image.asset('assets/images/logo_vertical.png'),
                          const SizedBox(height: 48),
                          const Text(
                            'Bem-vindo!',
                            style: ClinicsTheme.titleStyle,
                          ),
                          const SizedBox(height: 48),
                          TextFormField(
                            controller: firstNameEC,
                            validator: Validatorless.required(
                              'Nome obrigatório',
                            ),
                            decoration: const InputDecoration(
                              label: Text('Digite seu nome'),
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: lastNameEC,
                            validator: Validatorless.required(
                              'Sobrenome obrigatório',
                            ),
                            decoration: const InputDecoration(
                              label: Text('Digite seu sobrenome'),
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: sizeOf.width * 0.8,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                final valid =
                                    formKey.currentState?.validate() ?? false;
                                if (valid) {
                                  selfServiceController.setWhoIAmDataStepNext(
                                    firstNameEC.text,
                                    lastNameEC.text,
                                  );
                                }
                              },
                              child: const Text('CONTINUAR'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
