import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String hint;

  InputText({
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(6)
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: this.hint,
          border: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 13)
        ),
      ),
    );
  }
}