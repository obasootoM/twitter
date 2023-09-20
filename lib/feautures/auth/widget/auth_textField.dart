import 'package:flutter/material.dart';
import 'package:twitter/theme/pallet.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  const AuthTextField({super.key, required this.controller, required this.hintext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(11),
        hintText: hintext,
        helperStyle: const TextStyle(fontSize: 18),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 3, 
                color: Pallete.blueColor),
              borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Pallete.greyColor),

          )
              ),
    );
  }
}
