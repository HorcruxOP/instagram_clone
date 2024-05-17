// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/home.dart';
import 'package:instagram_clone/services/functions/authFunctions.dart';
import 'package:instagram_clone/services/functions/databaseFunctions.dart';
import 'package:instagram_clone/utils/customfontstyle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;
  final _formkey = GlobalKey<FormState>();
  String username = '', email = '', password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Instagram",
          style: CustomFontStyle.condensedBoldText.copyWith(
            fontSize: 35,
          ),
        ),
      ),
      body: Form(
        key: _formkey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                isLogin ? "Login" : "SignUp",
                style: CustomFontStyle.boldText.copyWith(
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 40),
              isLogin
                  ? const SizedBox()
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        style: CustomFontStyle.regularText.copyWith(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: CustomFontStyle.mediumText.copyWith(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                          errorBorder: const OutlineInputBorder(),
                          focusedErrorBorder: const OutlineInputBorder(),
                        ),
                        key: const ValueKey("username"),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Username cannot be empty";
                          } else if (value.toString().contains("@")) {
                            return "Username cannot contain @";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          setState(() {
                            username = newValue!;
                          });
                        },
                      ),
                    ),
              isLogin ? const SizedBox() : const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: TextFormField(
                  cursorColor: Colors.black,
                  style: CustomFontStyle.regularText.copyWith(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    labelStyle: CustomFontStyle.mediumText.copyWith(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    enabledBorder: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    errorBorder: const OutlineInputBorder(),
                    focusedErrorBorder: const OutlineInputBorder(),
                  ),
                  key: const ValueKey("email"),
                  validator: (value) {
                    if (!(value.toString().contains("@"))) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      email = newValue!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: TextFormField(
                  obscureText: true,
                  cursorColor: Colors.black,
                  style: CustomFontStyle.regularText.copyWith(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: CustomFontStyle.mediumText.copyWith(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    enabledBorder: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    errorBorder: const OutlineInputBorder(),
                    focusedErrorBorder: const OutlineInputBorder(),
                  ),
                  key: const ValueKey("password"),
                  validator: (value) {
                    if (value.toString().length < 6) {
                      return "Password must be at least 6 characters long";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      password = newValue!;
                    });
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text(
                  isLogin
                      ? "Don't have an account?"
                      : "Already have an account?",
                  style: CustomFontStyle.mediumText.copyWith(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.65,
                      50,
                    ),
                    shape: const ContinuousRectangleBorder()),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    if (isLogin) {
                      try {
                        var user = await signIn(email, password);
                        if (user == "user") {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                              (route) => false);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.black,
                              content: Text(
                                user,
                                style: CustomFontStyle.regularText.copyWith(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.black,
                            content: Text(
                              "Invalid Credentials",
                              style: CustomFontStyle.regularText.copyWith(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    } else {
                      bool result = await checkUsernameExists(username);
                      if (result) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.black,
                            content: Text(
                              "Username already taken",
                              style: CustomFontStyle.regularText.copyWith(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                        return;
                      }
                      var emailExists = await signUp(email, password);
                      if (emailExists != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.black,
                            content: Text(
                              emailExists,
                              style: CustomFontStyle.regularText.copyWith(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                        return;
                      } else {
                        createUserCredential(email, password, username);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                            (route) => false);
                      }
                    }
                  }
                },
                child: Text(
                  isLogin ? "Login" : "SignUp",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
