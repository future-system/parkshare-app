import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:parkshare_app/src/core/constants/assets.dart';
import 'package:parkshare_app/src/core/constants/design_system.dart';
import 'package:parkshare_app/src/core/navigation.dart';
import 'package:parkshare_app/src/core/secure_storage.dart';
import 'package:parkshare_app/src/data/models/login_model/login_model.dart';
import 'package:parkshare_app/src/presentation/components/buttons/custom_button.dart';
import 'package:parkshare_app/src/presentation/components/custom_form_field/custom_form_field.dart';
import 'package:parkshare_app/src/data/repository/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginRepository repository = LoginRepository();

  final TextEditingController controllerEmail = TextEditingController();

  final TextEditingController controllerPassword = TextEditingController();

  bool hidePassword = true;

  final _loginFormKey = GlobalKey<FormState>();


  void login(context) async {
    final areFieldsValid = _loginFormKey.currentState!.validate();

    final model = LoginModel(email: controllerEmail.text, password: controllerPassword.text);

    if (areFieldsValid && await repository.loginApp(model)) {
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

  Future<bool> isLoged() async{
    final SharedPreferences token = await SharedPreferences.getInstance();
    final credenciais = await Credentials().getCredentials();

    if(credenciais["email"] != "" && credenciais["password"] != "" || token.getString("token") != "" && token.getString("expire") != null){

      print(credenciais["email"]);
      print(credenciais["password"]);

      if(DateTime.parse(token.getString("expire") ?? "").isAfter(DateTime.now())){

        Navigator.pushNamed(
            context, Navigation.routing.home);

        return true;
      }
    }
    return false;

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isLoged(),
      builder: (context, snapshot) => (!snapshot.hasData) ? const Center(child: CircularProgressIndicator(),) :Scaffold(
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
                  key: _loginFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomFormField(
                        label: 'Email',
                        controller: controllerEmail,
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
                        controller: controllerPassword,
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
      ),
    );
  }
}
