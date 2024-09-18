import 'package:flutter/material.dart';
import 'package:parkshare_app/src/core/constants/design_system.dart';
import 'package:parkshare_app/src/core/navigation.dart';
import 'package:parkshare_app/src/presentation/components/buttons/custom_button.dart';
import 'package:parkshare_app/src/presentation/components/custom_form_field/custom_form_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _signupFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  bool didAcceptTerms = false;
  bool showTermsWarning = false;

  bool hidePassword = true;

  void _signup(context) {
    final areFieldsValid = _signupFormKey.currentState!.validate();
    if (!didAcceptTerms) {
      setState(() {
        showTermsWarning = true;
      });
    }
    if (areFieldsValid && didAcceptTerms) {
      Navigator.pushNamed(context, Navigation.routing.onboarding);
    }
  }

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
        child: SingleChildScrollView(
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
                key: _signupFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomFormField(
                      label: 'Nome',
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor insira seu nome';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      label: 'Email',
                      controller: emailController,
                      validator: (value) {
                        final RegExp emailRegex = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        );
                        if (value == null || value.isEmpty) {
                          return 'Por favor insira seu Email';
                        }
                        if (!emailRegex.hasMatch(value)) {
                          return 'Por favor insira um Email válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      label: 'Senha',
                      obscureText: hidePassword,
                      controller: passwordController,
                      suffix: GestureDetector(
                        onTap: () => setState(() {
                          hidePassword = !hidePassword;
                        }),
                        child: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor insira sua senha';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      controller: passwordConfirmController,
                      label: 'Confirmar senha',
                      obscureText: hidePassword,
                      suffix: GestureDetector(
                        onTap: () => setState(() {
                          hidePassword = !hidePassword;
                        }),
                        child: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor insira sua senha';
                        }
                        return null;
                      },
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
                            value: didAcceptTerms,
                            side: const BorderSide(width: 0.5),
                            onChanged: (value) {
                              setState(() {
                                didAcceptTerms = value!;
                                if (value) {
                                  showTermsWarning = false;
                                }
                              });
                            },
                          ),
                        ),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: showTermsWarning
                                    ? Colors.red.shade700
                                    : DesignSystem.colors.primary,
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900))
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
                            onPressed: () => _signup(context),
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
                            Navigator.pushReplacementNamed(
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
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
      ),
    );
  }
}
