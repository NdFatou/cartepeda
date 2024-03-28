// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

import '../res/app_logo.dart';
import 'login_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String username = '';
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: prefer_const_constructors
      body: Center(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(left: 20)),
              Image.asset(AppLogo.logo,width: 170,)
            ],
          ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text(
                    ' Le numerique : un outil \n d\'apprentissage',
                    style: TextStyle(fontSize: 17) ,)
      
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Adresse email',
                                  style: TextStyle(fontSize: 17,)
                                )
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 16)),
                            Row(children: [
                              Expanded(
                                child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 1.0, horizontal: 10.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none),
                                     hintStyle: TextStyle(fontWeight: FontWeight.normal ),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      hintText: 'Entrez votre email ',
                                    ),
                                    keyboardType: TextInputType.name,
                                    onChanged: (value) {},
                                    validator: (value) => value!.isEmpty
                                        ? 'Valider votre email'
                                        : null,
                                    onSaved: (value) => username = value!),
                              ),
                            ]),
                            Padding(padding: EdgeInsets.all(12)),
                            Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color(0xFF1D75BD)),
                                          padding: MaterialStatePropertyAll(
                                              EdgeInsets.only(
                                                  left: 35, right: 35))),
                                      onPressed: () {},
                                      child: Text('Envoyer',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ))),
                                )
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(12)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    var route = MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginScreen());
                                    Navigator.of(context).push(route);
                                  },
                                  child: Text('Connectez-vous',
                                      style: TextStyle(
                                          color: Color(0xFF7F7F7F),
                                          fontSize: 16,
                                          decoration:
                                              TextDecoration.underline))),
      
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
      ),
    ));
  }
}
