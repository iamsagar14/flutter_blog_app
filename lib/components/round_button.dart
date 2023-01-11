import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  RoundButton({required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        color: Colors.deepOrange,
        minWidth: double.infinity,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
