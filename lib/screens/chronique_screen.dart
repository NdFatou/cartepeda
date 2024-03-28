import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:l1/chroniques/chronique_model.dart';

import '../chroniques/list_chronique.dart';
import '../component/custom_appbar.dart';
import '../component/custom_drawer.dart';
import '../component/custom_filter.dart';
import '../res/app_icons.dart';

class ChroniqueScreen extends StatefulWidget {
  const ChroniqueScreen({super.key});

  @override
  State<ChroniqueScreen> createState() => _ChroniqueScreenState();
}

class _ChroniqueScreenState extends State<ChroniqueScreen> {

  void toggleFavorite(int index) {
    setState(() {
      chroniques[index].isFavorite = chroniques[index].isFavorite;
    });
  }

  void likeChronique(int index) {
    setState(() {
      chroniques[index].likes++;
    });
  }

  List<Chronique> _filteredChroniques = [];

  @override
  void initState() {
    _filteredChroniques.addAll(chroniques);
    super.initState();
  }

  void _filterChroniques(String searchText) {
    setState(() {
      _filteredChroniques = chroniques.where((chronique) {
        final titleLower = chronique.title.toLowerCase();
        final chroniqueurLower = chronique.chroniqueur.toLowerCase();
        final searchLower = searchText.toLowerCase();
        return titleLower.contains(searchLower) || chroniqueurLower.contains(searchLower);
      }).toList();
    });
  }

  void affiche(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              actionsPadding: EdgeInsets.all(20),
              actions: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Theme',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        buildFilterLabel('Education', context),
                        buildFilterLabel('Tidjanya', context),
                        buildFilterLabel('Fikh', context),
                        buildFilterLabel('Jeunesse', context),
                        buildFilterLabel('Religion', context),
                        buildFilterLabel('Politique', context),
                        buildFilterLabel('Vertu', context),
                        buildFilterLabel('Spiritualite', context),
                      ],
                    )
                  ],
                )
              ]
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      drawer: const CustomDrawer(),
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Chroniques",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(51, 51, 51, 1)),
                )
              ],
            ),

          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  hintText: 'œuvre, auteur...',
                  hintStyle: const TextStyle(
                      color: Color.fromRGBO(153, 153, 153, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Container(
                    margin: EdgeInsets.all(5),
                    width: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(29, 117, 189, 1),
                    ),
                    child: const Icon(Icons.search, color: Colors.white, size: 25,),
                  ),
                ),
                onChanged: (value) {
                  _filterChroniques(value);
                },
              )
          ),
          Container(
            padding: const EdgeInsets.only(top: 5.0,right: 20),
            decoration: BoxDecoration(
              color: Color.fromRGBO(251, 251, 251, 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () => affiche(context),
                    icon: SvgPicture.asset(
                      AppIcons.filterIcons,
                      height: 20,
                      width: 20,
                      color:Color.fromRGBO(119,119,119,1),
                    )),
                Text('FILTRE',
                    style:
                    TextStyle(
                      fontSize:14 ,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(119,119,119,1),
                    ))
              ],
            ),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(251, 251, 251, 1),
              ),
              child: ListView.builder(
                itemCount: _filteredChroniques.length,
                  itemBuilder: (context, index){
                    return Card(
                      elevation: 0,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                                  foregroundColor: Colors.white,
                                  backgroundImage: AssetImage(''),
                                  radius: 20,
                                ),

                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                        chroniques[index].chroniqueur,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Color.fromRGBO(0,0, 0, 1),
                                      ),
                                    ),
                                    subtitle: Text(
                                        "Il y a ${chroniques[index].publicationDay} jours",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                        color: Color.fromRGBO(0,0, 0, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.7, // Ajuster la hauteur de l'image en fonction de la largeur de l'écran
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                 chroniques[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 0, right: 0 ,top: 25.0, bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chroniques[index].title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(51, 51, 51, 1),
                                  ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              chroniques[index].isFavorite ? Icons.favorite : Icons.favorite_border,
                                              color: chroniques[index].isFavorite ? Colors.red : null,
                                            ),
                                            onPressed: () => toggleFavorite(index),
                                          ),
                                          Text('${chroniques[index].likes}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              color: Color.fromRGBO(0,0, 0, 1),
                                            ),
                                          ),
                                          IconButton(
                                            icon: SvgPicture.asset(AppIcons.commentIcons),
                                            onPressed: () {},
                                          ),
                                          Text(
                                            '${chroniques[index].comment}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              color: Color.fromRGBO(0,0, 0, 1),
                                            ),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            icon: SvgPicture.asset(AppIcons.shareIcons),
                                            onPressed: () {
                              // Ajouter une logique pour partager le livre
                                            },
                                          ),
                                          IconButton(
                                            icon: SvgPicture.asset(AppIcons.favorisIcons),
                                            onPressed: () => likeChronique(index),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 0, right: 0 ,top: 25.0, bottom: 20 ),
                                    child: Text(
                                      chroniques[index].description,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(0,0, 0, 1),
                                      ),),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ),


        ],
      ),
    );
  }

}


