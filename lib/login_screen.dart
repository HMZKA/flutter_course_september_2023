import 'package:flutter/material.dart';
import 'package:flutter_application_course/components.dart';
import 'auth_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isScure = true;
  var icon = Icons.visibility;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          showMessage();
        } else if (state is LoginErrorState) {
          showMessage();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: const Text("LoginScreen"),
            centerTitle: true,
          ),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/10.jpg"), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "email is required";
                          } else if (!(value.contains('@'))) {
                            return "this is not a valid email";
                          }
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "example@example.com",
                            label: const Text("Email"),
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25))),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password is required";
                          }
                        },
                        obscureText: isScure,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            label: const Text("Password"),
                            hintText: "P@ssw0rd",
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isScure = !isScure;
                                    isScure
                                        ? icon = Icons.visibility
                                        : icon = Icons.visibility_off;
                                  });
                                },
                                icon: Icon(icon)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              AuthCubit().get(context).login(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25)),
                              child: state is LoginLoadingState
                                  ? Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.white),
                                    )
                                  : const Text(
                                      "Sign in",
                                      textAlign: TextAlign.center,
                                    ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have account?",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Create account"),
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
