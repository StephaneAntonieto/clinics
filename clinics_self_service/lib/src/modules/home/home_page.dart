import 'package:clinics_core/clinics_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: ClinicsAppBar(
        actions: [
          PopupMenuButton<int>(
            child: const IconPopupMenu(),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Iniciar Terminal'),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text('Finalizar Terminal'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 122),
          padding: const EdgeInsets.all(40),
          width: sizeOf.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ClinicsTheme.orangeColor),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Bem vindo!', style: ClinicsTheme.titleStyle),
              const SizedBox(height: 32),
              SizedBox(
                width: sizeOf.width * .8,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('INICIAL TERMINAL'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
