import 'package:flutter/material.dart';
import 'package:outflow_v2/view/widgets/custom_scafold.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScafold(
      title: "Login",
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
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _signupFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 32,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "User Email",
                        labelStyle: TextStyle(
                          color: Color(0xFF3D3D3D),
                          fontSize: 16,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Color(0xFF3D3D3D),
                          fontSize: 16,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _submitSignupForm,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
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
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _submitSignupForm() {
    if (_signupFormKey.currentState!.validate()) {
      print("Form is valid");
    } else {
      print("Form is not valid");
    }
  }
}
