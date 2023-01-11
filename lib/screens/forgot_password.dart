import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/round_button.dart';
import 'home_screen.dart';

class ForgortPassword extends StatefulWidget {
  const ForgortPassword({Key? key}) : super(key: key);

  @override
  State<ForgortPassword> createState() => _ForgortPasswordState();
}

class _ForgortPasswordState extends State<ForgortPassword> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  bool showSpinner = false;

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Forgot Password'),
          backwardsCompatibility: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'email',
                            border: OutlineInputBorder(),
                            hintText: 'enter email',
                            prefixIcon: Icon(Icons.email_outlined)),
                        onChanged: (String value) {
                          email = value;
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'enter email' : null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: RoundButton(
                            title: 'Recover Password',
                            onPress: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  showSpinner = true;
                                });
                                try {
                                  _auth
                                      .sendPasswordResetEmail(
                                          email:
                                              emailController.text.toString())
                                      .then((value) {
                                    setState(() {
                                      showSpinner = false;
                                    });
                                    toastMessage(
                                        'Please check your email,Reset pin has been send to your email!');
                                  }).onError((error, stackTrace) {
                                    toastMessage(error.toString());
                                    setState(() {
                                      showSpinner = false;
                                    });
                                  });
                                } catch (e) {
                                  print(e.toString());
                                  toastMessage(e.toString());
                                  setState(() {
                                    showSpinner = false;
                                  });
                                }
                              }
                            }),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
