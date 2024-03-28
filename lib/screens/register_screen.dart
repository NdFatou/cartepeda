// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

import '../component/Helper.dart';
import '../component/getTexformField.dart';
import '../res/app_icons.dart';
import '../res/app_logo.dart';
import 'login_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  /*String firstName = '';
  String lastName = '';
  String email = '';*/
  String password = '';
  String cPassword = '';

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  bool firstNameChanged = false;
  bool lastNameChanged = false;
  bool emailChanged = false;
  bool passwordChanged = false;
  bool cPasswordChanged = false;

  final formkey = GlobalKey<FormState>();



  validator () {

    password = passwordController.text;
    cPassword = cPasswordController.text;

    if (formkey.currentState!.validate()) {
      if(password != cPassword)
      {
        alertDialog(context, "Mot de passe incorrect");
      }else {
        formkey.currentState!.save();
        formkey.currentState!.reset();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
               style:TextStyle(fontSize: 15) ,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                        ElevatedButton.icon(
                        onPressed: null,
                        icon: Image.asset(AppIcons.google,height: 22,width: 22,),
                        label: Text(
                          'Via Google',
                          style: TextStyle(
                              color: Colors.black,
                            ),
                        ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor:Colors.transparent,
                            disabledForegroundColor: Colors.transparent.withOpacity(0),
                            disabledBackgroundColor: Colors.transparent.withOpacity(0),
                          ),
                             
                      ),
                        ElevatedButton.icon(

                          onPressed: null,
                          icon: Icon(
                            Icons.facebook,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Facebook',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStatePropertyAll(Color.fromRGBO(24, 119, 242, 1),)),
                        )
                      ],
                    ),
                 
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
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
                    padding: EdgeInsets.all(16),
                    child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Text('Prenom',style:  TextStyle(fontSize: 17,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top:8)),
                      Row(
                        children: [
                          Expanded(
                          child: getTextFormField(
                            name: 'Prenom',
                            controller: firstNameController,
                            inputType: TextInputType.name,
                            hintName: 'Fatoumata',
                            obscuredText: false,
                            onChanged: (value) {
                              setState(() {
                                firstNameChanged = true;
                              });
                            },
                          ),
                        ),
                    ]),
                    SizedBox(
                    height: 16,
                  ),
                     Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Text('Nom de Famille',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top:8)),
                      Row(
                        children: [
                          Expanded(
                          child:getTextFormField(
                            name: 'Nom',
                            controller: lastNameController,
                            inputType: TextInputType.name,
                            hintName: 'Diallo',
                            obscuredText: false,
                            onChanged: (value) {
                              setState(() {
                                lastNameChanged = true;
                              });
                            },
                          ),

                        ),
                    ]),
                    SizedBox(
                    height: 16,
                  ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Text('Email',style:TextStyle(fontSize: 17,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top:8)),
                      Row(
                        children: [
                          Expanded(
                          child: getTextFormField(
                            name: 'Email',
                            obscuredText: false,
                            controller: emailController,
                            inputType: TextInputType.name,
                            hintName: 'exemple@gmail.com',
                            onChanged: (value) {
                              setState(() {
                                emailChanged = true;
                              });
                            },
                          ),
                        ),
                    ]),
                     SizedBox(
                    height: 16,
                  ),   
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Text('Mot de passe',style:TextStyle(fontSize: 17,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top:8)),
                      Row(
                        children: [
                          Expanded(
                        child: getTextFormField(
                          name: 'Mot de passe',
                          controller: passwordController,
                          inputType: TextInputType.name,
                          hintName: '******',
                          obscuredText: true,
                          onChanged: (value) {
                            setState(() {
                              passwordChanged = true;
                            });
                          },
                        )
                          ),

                        ],
                      ),
                      SizedBox(
                    height: 16,
                  ),
                   Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Text('Confirmer mot de passe',style:  TextStyle(fontSize: 17,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top:8)),
                  Row(
                    children: [
                      Expanded(
                        child: getTextFormField(
                          name: 'mot de passe',
                          controller: cPasswordController,
                          inputType: TextInputType.name,
                          hintName: '******',
                          obscuredText: true,
                          onChanged: (value) {
                            setState(() {
                              cPasswordChanged = true;
                            });
                          },
                        )
                        /*TextFormField(
                    decoration: InputDecoration(
                     contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                                border:OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10.0),
                                 borderSide: BorderSide.none,
                                ),
                               hintStyle: TextStyle(fontWeight: FontWeight.normal ),
                                filled: true,
                      fillColor: Color.fromRGBO(252, 252, 252, 1),
                      hintText: '********',
                    ),
                    keyboardType: TextInputType.name,
                          onChanged: (value) {
                            setState(() {
                              cPasswordChanged = true;
                            });
                          },
                    validator: (value) =>
                        value!.isEmpty ? 'Valider votre mot de passe' : null,
                    onSaved: (value) => cPassword = value!,
                    obscureText: true,
                  ),*/
                  ),

                    ],
                  ),

                      Padding(padding: EdgeInsets.all(12)),
                      Row(
                  children: [
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),backgroundColor:MaterialStatePropertyAll(Color.fromRGBO(29, 117, 189, 1)),
                    ),
                            onPressed:() { validator();
                        },
                            child: Text('Créer mon compte',style:TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w600))),
               )
                  ],
                ),
                      SizedBox(
                      height: 16,
                    ),
                  
                    Center(
                      child: (Text(
                      'Vous avez deja un compte?',
                      style:TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
                    )),
                  ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                      child: InkWell(
                      onTap: () {
                        var route = MaterialPageRoute(builder: (BuildContext context) =>LoginScreen());
                        Navigator.of(context).push(route);
                      },
                      child: Text(
                        'Connectez-vous',
                        style: TextStyle(
                          color:Color.fromRGBO(49, 159, 67, 1),
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        )
                      ),
                    ),
                  ),
                    ],
                  ),) ],
              ),
            ),
          ),
        ]),
            ),
      ));
  }
}