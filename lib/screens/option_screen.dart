import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/components/round_button.dart';
import 'package:flutter_blog_app/screens/login_screen.dart';
import 'package:flutter_blog_app/screens/sign_in.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/writing-blogs.jpg'),
              ),
              SizedBox(
                height: 30.0,
              ),
              RoundButton(
                  title: 'Login',
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }),
              SizedBox(
                height: 30.0,
              ),
              RoundButton(
                title: 'Register',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIN(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
