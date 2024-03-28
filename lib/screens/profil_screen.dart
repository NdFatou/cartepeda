// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../component/custom_drawer.dart';
import '../res/app_icons.dart';
import '../res/app_image.dart';
import '../res/app_logo.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(preferredSize: Size(1, 1), child: Divider()),
          titleSpacing: 2,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Image.asset(
            AppLogo.logo,
            fit: BoxFit.contain,
            width: 125,
            height: 35,
            alignment: Alignment.center,
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: SvgPicture.asset(AppIcons.menuIcons,width: 40,height:40,),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.notificationIcons),
            ),
            CircleAvatar(
              backgroundColor: Color(0xFF1D75BD),
              foregroundColor: Colors.white,
              backgroundImage: AssetImage(AppImage.photo),
              radius: 20,
            ),
            Padding(padding: EdgeInsets.only(right: 15))
          ],
        ),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Text(
                    'Profil',
                    style:TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ]),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 15.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF1D75BD),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          backgroundImage: AssetImage(AppImage.photo),
                          radius: 70,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Aliou Mamadou Dia',
                          style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'pseudoname',
                          style:  TextStyle(
                                  fontSize: 14,color: Color(0xFF7F7F7F)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'example@gmail.com',
                          style: TextStyle(
                                  fontSize: 14,color: Color(0xFF7F7F7F) ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextButton(
                      style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        
                      ),backgroundColor:MaterialStatePropertyAll(Colors.black87),
                                        ),
                      onPressed:() {},
                       child: Text('modifier profil',style:  TextStyle(color: Colors.white, fontSize: 20,))
                                        ),
                      
                      ]),
                ),
                SizedBox(
                          height: 50,
                        ),
                Row(children: [
                  Text(
                    'Favoris',
                    style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ],
            ),
          ),
        ));
  }
}
