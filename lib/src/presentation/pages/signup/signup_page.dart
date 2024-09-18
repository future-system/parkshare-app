import 'package:flutter/material.dart';
import 'package:parkshare_app/src/core/constants/design_system.dart';
import 'package:parkshare_app/src/core/navigation.dart';
import 'package:parkshare_app/src/presentation/components/buttons/custom_button.dart';
import 'package:parkshare_app/src/presentation/components/custom_form_field/custom_form_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: DesignSystem.colors.background,
        title: const Text(
          'Criar Conta',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    'Preencha suas informações  ou registre utilizando sua rede social.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomFormField(
                    label: 'Nome',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomFormField(
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomFormField(
                    label: 'Senha',
                    suffix: Icon(
                      Icons.visibility_off,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomFormField(
                    label: 'Confirmar senha',
                    suffix: Icon(
                      Icons.visibility_off,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Transform.scale(
                        scale: 1.4,
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          value: false,
                          side: const BorderSide(width: 0.5),
                          onChanged: (value) {},
                        ),
                      ),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: DesignSystem.colors.primary,
                              fontSize: 16,
                            ),
                            text: 'Aceito e concordo com os ',
                            children: const [
                              TextSpan(
                                  text: 'Termos de Uso ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w900)),
                              TextSpan(
                                text: 'e  ',
                              ),
                              TextSpan(
                                  text: 'Políticas de Privacidade ',
                                  style: TextStyle(fontWeight: FontWeight.w900))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Navigation.routing.onboarding);
                          },
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: const ButtonStyle(
                            visualDensity: VisualDensity.compact,
                            padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Navigation.routing.signup);
                        },
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                color: DesignSystem.colors.secondary,
                              ),
                              text: 'Já possui cadastro? ',
                              children: const [
                                TextSpan(
                                    text: 'Entrar',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
