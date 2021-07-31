import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData data;
  final String hintText;
  final String value;
  bool isObsecure = true;

  CustomTextField({
    Key key,
    this.controller,
    this.data,
    this.hintText,
    this.isObsecure,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: _screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        obscureText: isObsecure,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            data,
            color: Colors.cyan,
          ),
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText,
          //errorText: _validate ? 'Value Can\'t Be Empty' : null,
        ),
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) {
            return 'Field is empty';
          }
        },
      ),
    );
  }
}
