import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isScure = true;
  var icon = Icons.visibility;
  @override
  Widget build(BuildContext context) {
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
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
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)))),
                onPressed: () {},
                child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: const Text(
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
    );
  }
}
