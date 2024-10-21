import 'package:flutter/material.dart';
import 'package:parkshare_app/src/core/constants/design_system.dart';
import 'package:parkshare_app/src/core/navigation.dart';
import 'package:parkshare_app/src/data/repository/onboarding_repository.dart';
import 'package:parkshare_app/src/presentation/components/buttons/custom_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  OnboardingRepository repository = OnboardingRepository();

  void createClient(context) async{

    if(await repository.createClient()) {
      Navigator.pushNamed(
          context, Navigation.routing.vehicleRegistration);
    }

  }

  void createAssociated(context) async {

    if(await repository.createAssociated()){

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Encontre e reserve a vaga de garagem perfeita, no horário que você precisa.',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                              onPressed: () => createClient(context),
                              child: const Text('Buscar garagem')),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Quer alugar sua própria garagem?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: DesignSystem.colors.textDetail, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                              onPressed: () {},
                              child: const Text('Sim, quero!')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
