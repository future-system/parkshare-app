import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:parkshare_app/src/core/constants/assets.dart';
import 'package:parkshare_app/src/core/constants/design_system.dart';
import 'package:parkshare_app/src/core/navigation.dart';
import 'package:parkshare_app/src/data/models/login_model/login_model.dart';
import 'package:parkshare_app/src/presentation/components/buttons/custom_button.dart';
import 'package:parkshare_app/src/presentation/components/custom_form_field/custom_form_field.dart';
import 'package:parkshare_app/src/data/repository/login_repository.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginRepository repository = LoginRepository();

  final TextEditingController controllerEmail = TextEditingController();

  final TextEditingController controllerPassword = TextEditingController();

  void login(context) async {
    final model = LoginModel(email: controllerEmail.text, password: controllerPassword.text);

    if (await repository.loginApp(model)) {
      Navigator.pushNamed(
          context, Navigation.routing.onboarding);
    }

  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: DesignSystem.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.images.logo,
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
                    CustomFormField(
                      label: 'Email',
                      controller: controllerEmail,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                        label: 'Senha',
                        controller: controllerPassword,
                        suffix: const Icon(
                          Icons.visibility_off,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueci minha senha',
                            style:
                                TextStyle(color: DesignSystem.colors.secondary),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onPressed: () => login(context),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: DesignSystem.colors.secondary,
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                    child: Text(
                      'Ou entre com',
                      style: TextStyle(fontSize: 18),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: DesignSystem.colors.secondary,
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
                  IconButton(
                    onPressed: signInWithGoogle,
                    icon: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Assets.images.google,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: const ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                onPressed: () {
                  Navigator.pushNamed(context, Navigation.routing.signup);
                },
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: DesignSystem.colors.secondary,
                      ),
                      text: 'Não tem conta? ',
                      children: const [
                        TextSpan(
                            text: 'Cadastre-se',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
