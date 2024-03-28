// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:l1/component/custom_filter.dart';
import 'package:l1/screens/chronique_screen.dart';

import '../res/app_icons.dart';
import '../res/app_logo.dart';
import '../screens/bibliotheque_screen.dart';
import '../screens/profil_screen.dart';
import '../screens/video_screen.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)) ,
      child: ListView(
        children: [
       Image.asset(
            AppLogo.logo,
            fit: BoxFit.contain,
            width: 170,height: 40,
            alignment: Alignment.center,
          ),
        Divider(
          thickness:1,
        ),
        Padding(padding: EdgeInsets.only(top: 25)),
        Container(
          padding: EdgeInsets.only(left: 16),
          child: Column(
            children:[ ListTile(
               leading: SvgPicture.asset(AppIcons.feedIcons),
                title: Text('Fil d\'actualité',
                style: TextStyle(fontSize: 20 ),
                ),
                
                onTap: () {
                  // Action à effectuer lors du clic sur l'accueil
                  Navigator.pop(context);
                },
              ),
              ListTile(
          leading: SvgPicture.asset(AppIcons.chronicIcons),
          title: Text('Chroniques',
           style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            var route = MaterialPageRoute(builder: (BuildContext context) =>ChroniqueScreen());
            Navigator.of(context).push(route);
          },
        ),
        ListTile(
          leading: Icon(Icons.video_call),
          title: Text('Vidéothèques',
           style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            var route = MaterialPageRoute(builder: (BuildContext context) =>VideothequeScreen());
            Navigator.of(context).push(route);
          },
        ),
        ListTile(
          leading: SvgPicture.asset(AppIcons.poadcastIcons),
          title: Text('Podcasts',
           style:TextStyle(fontSize: 20),
          ),
          onTap: () {

            Navigator.of(context).pop(context);
          },
        ),
        ListTile(
          leading: SvgPicture.asset(AppIcons.bibliothequeIcons),
          title: Text('Bibliothèques',
           style: TextStyle(fontSize: 20),
          ),
          onTap: () {
             var route = MaterialPageRoute(builder: (BuildContext context) =>BibliothequeScreen());
                       Navigator.of(context).push(route);
          },
        ),
        SizedBox(height: 100,),
         ListTile(
              leading: SvgPicture.asset(AppIcons.paramIcons),
              title: Text('Paramètres',
               style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Action à effectuer lors du clic sur les paramètres
                Navigator.pop(context);
              },
            ),
            ListTile(
              // splashColor: Color(0xFF1D75BD),
              // hoverColor: Color(0xFF1D75BD),
              leading: SvgPicture.asset(AppIcons.userIcons),
              title: Text('Profil',
               style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                var route = MaterialPageRoute(builder: (BuildContext context) =>ProfilScreen());
                       Navigator.of(context).push(route);
              },
            ),
        ]),
        ),
        

      ]),
    );
  }
}
