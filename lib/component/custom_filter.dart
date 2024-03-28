import 'package:flutter/material.dart';


class MyFilterScreen extends StatefulWidget {
  @override
  _MyFilterScreenState createState() => _MyFilterScreenState();
}

class _MyFilterScreenState extends State<MyFilterScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}


Widget buildFilterLabel(String label,BuildContext context,[void Function()? filter]) {
  return TextButton(onPressed: () {
    Navigator.of(context).pop();
    filter?.call();
  },
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10,vertical: 10)),
      minimumSize: MaterialStateProperty.all(Size(0, 0)),
      backgroundColor:MaterialStatePropertyAll(
          Color.fromRGBO(245, 245, 245, 1)
      ),
    ),child:Text(label,style: TextStyle(fontSize: 15,color: Colors.black),) ,
  );
}