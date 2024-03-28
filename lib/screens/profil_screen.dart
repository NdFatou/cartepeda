// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../component/custom_appbar.dart';
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
        appBar: CustomAppbar(),
        drawer: CustomDrawer(),
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(right: 16, left: 16),
                child: Row(
                  children: [
                    Text(
                      'Profil',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: EdgeInsets.only(right: 16, left: 16),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 11.25,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(29, 117, 189, 1),
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
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(51, 51, 51, 1)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'pseudoname',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(153, 153, 153, 1)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'example@gmail.com',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(153, 153, 153, 1)),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromRGBO(51, 51, 51, 1)),
                                ),
                                onPressed: () {},
                                child: Text('modifier profil',
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600))),
                            Padding(padding: EdgeInsets.all(16))
                          ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: EdgeInsets.only(right: 16, left: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Donner votre point de vue sur \n un sujet donné",
                                style: TextStyle(
                                    color: Color.fromRGBO(51, 51, 51, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                Color.fromRGBO(255, 255, 255, 1),
                                side: BorderSide(
                                    color: Color.fromRGBO(29, 117, 189, 1)),
                              ),
                              child: Text(
                                'Mes Chroniques',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(29, 117, 189, 1),
                                ),
                              ),
                            ),

                            SizedBox(
                                width:
                                16), // Espace entre les boutons (ajustez selon vos besoins)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  Color.fromRGBO(29, 117, 189, 1),
                                  side: BorderSide(
                                      color: Color.fromRGBO(29, 117, 189, 1)),
                                ),
                                child: Text(
                                  'Nouveau',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                      ]),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                color: Color.fromRGBO(255, 255, 255, 1),
                margin: EdgeInsets.only(right: 16, left: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              'Favoris',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(51, 51, 51, 1)),
                              textAlign: TextAlign.center,
                            ),
                          ]),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 75,
                                width: 107.14,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: Image.asset(
                                      AppImage.photo,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Row(

                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.video_library,
                                              weight: 15, size: 15)),
                                      Text(
                                        "poste le 02 janv",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                153, 153, 153, 1),
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "A.M.D La Solution",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(51, 51, 51, 1)),
                                      ),
                                    ],
                                  ),
                                  Row(

                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: null,
                                              icon: SvgPicture.asset(
                                                AppIcons.heartIcons,
                                                width: 20,
                                                height: 20,
                                              )),
                                          Text("513 likes")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: null,
                                            icon: SvgPicture.asset(
                                              AppIcons.shareIcons,
                                              width: 20,
                                              height: 20,
                                            ),
                                            iconSize: 20,
                                          ),
                                          IconButton(
                                            onPressed: null,
                                            icon: SvgPicture.asset(
                                              AppIcons.favorisIcons,
                                              width: 20,
                                              height: 20,
                                            ),
                                            color:
                                            Color.fromRGBO(51, 51, 51, 1),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 75,
                                width: 107.14,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: Image.asset(
                                      AppImage.photo,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Row(

                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.video_library,
                                              weight: 15, size: 15)),
                                      Text(
                                        "poste le 02 janv",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                153, 153, 153, 1),
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Adaabul Masdjid",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(51, 51, 51, 1)),
                                      ),
                                    ],
                                  ),
                                  Row(

                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: null,
                                              icon: SvgPicture.asset(
                                                AppIcons.heartIcons,
                                                width: 20,
                                                height: 20,
                                              )),
                                          Text("513 likes")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: null,
                                            icon: SvgPicture.asset(
                                              AppIcons.shareIcons,
                                              width: 20,
                                              height: 20,
                                            ),
                                            iconSize: 20,
                                          ),
                                          IconButton(
                                            onPressed: null,
                                            icon: SvgPicture.asset(
                                              AppIcons.favorisIcons,
                                              width: 20,
                                              height: 20,
                                            ),
                                            color:
                                            Color.fromRGBO(51, 51, 51, 1),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(16))
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                color: Color.fromRGBO(255, 255, 255, 1),
                margin: EdgeInsets.only(right: 16, left: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              'Mes Chroniqueurs',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(51, 51, 51, 1)),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.indigo,
                                foregroundColor: Colors.white,
                                backgroundImage: AssetImage(AppImage.photo),
                                radius: 25,
                              ),
                              Padding(padding: EdgeInsets.only(right: 8)),
                              Expanded(
                                  child: Text(
                                    "Boubacar Dieng",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(51, 51, 51, 1)),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.indigo,
                                foregroundColor: Colors.white,
                                backgroundImage: AssetImage(AppImage.photo),
                                radius: 25,
                              ),
                              Padding(padding: EdgeInsets.only(right: 8)),
                              Expanded(
                                  child: Text(
                                    "Al Maktoum",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(51, 51, 51, 1)),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(16))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}