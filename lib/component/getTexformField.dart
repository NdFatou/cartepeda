import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Helper.dart';

class getTextFormField extends StatelessWidget{
  TextEditingController controller;
  String hintName;
  final ValueChanged<String>? onChanged;
  TextInputType inputType;
  bool obscuredText = false;
  String name = '';

  getTextFormField({
    required this.controller,
    required this.hintName,
    required this.name,
    this.inputType = TextInputType.text,
    this.onChanged,
    required this.obscuredText,
  });

  @override
  Widget build(BuildContext context){
    return  Container(
      //padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        validator: (value){
          if(name == 'Email' && !validateEmail(value!)){
            return 'Entrez un mail valide';
          }
         if((value == null || value.isEmpty)){
            return "Renseignez votre $name";
          }
         else
            {
              return name;
            }

          return null;
        },
        onSaved: (val) => controller.text = val!,
        onChanged: onChanged,
        obscureText: obscuredText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(fontWeight: FontWeight.normal ),
          filled: true,
          fillColor: Color.fromRGBO(252, 252, 252, 1),
          hintText: hintName,
          labelText: hintName,

        ),
      ),
    );
  }

}
