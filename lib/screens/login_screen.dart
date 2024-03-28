
// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../component/getTexformField.dart';
import '../res/app_icons.dart';
import '../res/app_logo.dart';
import 'home_screen.dart';
import 'register_screen.dart';
import 'reset_password.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  String username = '';
  String password = '';
  final formkey = GlobalKey<FormState>();
  final userController = TextEditingController();

  bool emailChanged = false;
  bool passwordChanged = false;

  validator() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      debugPrint(username);
      debugPrint(password);
      formkey.currentState!.reset();
    } else {
      debugPrint('Erreur');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor:Colors.white ,
      ) ,
        // ignore: prefer_const_constructors
      body: SingleChildScrollView(
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
                style: TextStyle(fontSize: 15)
              ),
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
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top:16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       Container(
                         decoration: BoxDecoration(
                           color: Color.fromRGBO(250, 250, 250, 1),
                           borderRadius: BorderRadius.circular(17.0),
                         ),
                         child: ElevatedButton.icon(
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.transparent,
                             shadowColor:Colors.transparent,
                             disabledForegroundColor: Colors.transparent.withOpacity(0),
                             disabledBackgroundColor: Colors.transparent.withOpacity(0),
                           ),
                            onPressed: null,
                            icon: Image.asset(AppIcons.google,height: 22,width: 22,),
                            label: Text(
                              'via Google',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                       ),
                        ElevatedButton.icon(
                          onPressed: null,
                          icon: Icon(
                            Icons.facebook,
                            color: Colors.white,
                          ),
                          label: Text(
                            'facebook',
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
                    
                  ),
                  
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16,right: 16,bottom: 16),
                    child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Text(
                               'Nom d\'utilisateur',
                               style:TextStyle(fontSize: 17,fontWeight: FontWeight.w600)),
                        ],
                      ),
                       Padding(padding: EdgeInsets.only(top:8)),
                          Row(
                           
                            children: [
                              Expanded(
                              child:  getTextFormField(
                                name: 'Email',
                                obscuredText: false,
                                controller: userController,
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

                          Text('Mot de passe',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600)),

                          SizedBox(width: 50,),

                        ],

                      ),
                       Padding(padding: EdgeInsets.only(top:8)),
                  Row(
                    children: [
                      Expanded(
                      child: /*getTextFormField(
                        controller: passwordController,
                        inputType: TextInputType.name,
                        hintName: '******',
                        obscuredText: true,
                        onChanged: (value) {
                          setState(() {
                            passwordChanged = true;
                          });
                        },
                      )*/
    TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                                border:OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10.0),
                                 borderSide: BorderSide.none
                                 
                                ),
                          hintText: '********',
                          hintStyle: TextStyle(fontWeight: FontWeight.normal ),

                          filled: true,
                          fillColor: Color.fromRGBO(252, 252, 252, 1),
                        ),
                        
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          setState(() {
                            passwordChanged = true;
                          });
                        },
                        validator: (value) =>
                            value!.isEmpty ? 'Valider votre mot de passe' : null,
                        onSaved: (value) => password = value!,
                        obscureText: true,
                      
                      ),
                    ),
                    ]),
                      Padding(padding: EdgeInsets.all(8)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(onTap: () {
                            var route = MaterialPageRoute(builder: (BuildContext context) =>ResetPassword());
                            Navigator.of(context).push(route);
                          },child: Text('Mot de passe oublié?',
                              style:TextStyle(color: Color.fromRGBO(153, 153, 153, 1), fontSize: 15,decoration: TextDecoration.none)

                          ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(8)),
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
                        onPressed:() {
                          var route = MaterialPageRoute(builder: (BuildContext context) =>HomeScreen());
                          Navigator.of(context).push(route);
                         }, child: Text('Connecter',style:  TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w600))
                                        ),
                    ),
                  ],
                ),
                      SizedBox(
                        height: 16,
                      ),
                  
                      Center(
                        child: (Text(
                       'Vous n\'avez pas de compte?',
                        style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
                        )),
                  ),
                      SizedBox(
                    height: 8,
                  ),
                      Center(
                    child: InkWell(
                      onTap: () {
                        var route = MaterialPageRoute(builder: (BuildContext context) =>RegisterScreen());
                       Navigator.of(context).push(route);
                      },
                      child: Text(
                        'Inscrivez-vous',
                        style: TextStyle(
                          color: Color.fromRGBO(49, 159, 67, 1),
                          fontSize: 16,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                    ],
                  ),) ],
              ),
            ),
          ),
        ]),
      ));
  }
}
