import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:outflow_v2/services/auth_service.dart';
import 'package:outflow_v2/view/screen/login_screen.dart';
import 'package:outflow_v2/view/widgets/custom_scafold.dart';
import 'package:outflow_v2/view/widgets/custom_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  String errorMessage = "";

  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  @override
  Widget build(BuildContext context) {
    return CustomScafold(
      title: "Sign up",
      showAppBar: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg-image.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/animations/login-anime.json',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomTextFormField(
                      labelText: "User email",
                      isPassword: false,
                      onValidate: (String? value) {
                        if (value != null) {
                          if (emailRegex.hasMatch(value) == false) {
                            return "Please enter valid email";
                          }
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        email = value!;
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextFormField(
                      labelText: "Password",
                      isPassword: true,
                      onValidate: (String? value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return "Please enter valid password";
                          }
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        password = value!;
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _signup,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // <-- Radius
                              ),
                              textStyle: const TextStyle(
                                color: Color(0xFF3D3D3D),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              backgroundColor: const Color(0xFFFFFFFF),
                            ),
                            child: const Text("Sign up"),
                          ),
                        ),
                      ],
                    ),
                    _getErrorMessage(),
                    const SizedBox(height: 32),
                    GestureDetector(
                      onTap: onTapNavigate,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Divider(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: null,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Image(
                              image:
                                  AssetImage('assets/images/google-logo.png'),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        GestureDetector(
                          onTap: null,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Image(
                              image: AssetImage('assets/images/apple-logo.png'),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _signup() async {
    setState(() {
      errorMessage = "";
    });

    if (formKey.currentState!.validate() == false) {
      return;
    }

    formKey.currentState!.save();

    try {
      await AuthService().signupWithEmailPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      setState(() {
        errorMessage = error.message!;
      });
    }
  }

  Widget _getErrorMessage() {
    if (errorMessage != null) {
      if (errorMessage!.isNotEmpty) {
        return Container(
          decoration: BoxDecoration(color: Colors.yellow[100]),
          margin: const EdgeInsets.only(top: 24.0),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  errorMessage!,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }

    return const SizedBox();
  }

  void onTapNavigate() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}
