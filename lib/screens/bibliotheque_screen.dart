import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:l1/screens/lecture_biblio.dart';

import '../book/book_model.dart';
import '../book/list_book.dart';
import '../component/custom_appbar.dart';
import '../component/custom_drawer.dart';
import '../component/custom_filter.dart';
import '../res/app_icons.dart';

class BibliothequeScreen extends StatefulWidget {
  const BibliothequeScreen({super.key});

  @override
  State<BibliothequeScreen> createState() => _BibliothequeScreenState();
}

class _BibliothequeScreenState extends State<BibliothequeScreen> {

  void toggleFavorite(int index) {
    setState(() {
      books[index].isFavorite = !books[index].isFavorite;
    });
  }

  void likeBook(int index) {
    setState(() {
      books[index].likes++;
    });
  }

  List<Book> _filteredBooks = [];

  @override
  void initState() {
    _filteredBooks.addAll(books);
    super.initState();
  }

  void _filterBooks(String searchText) {
    setState(() {
      _filteredBooks = books.where((book) {
        final titleLower = book.title.toLowerCase();
        final authorLower = book.author.toLowerCase();
        final searchLower = searchText.toLowerCase();
        return titleLower.contains(searchLower) || authorLower.contains(searchLower);
      }).toList();
    });
  }

  affiche(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          surfaceTintColor: Colors.white,
          scrollable: true,
          actionsPadding: EdgeInsets.all(20),
          actions: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Type', style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),)
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      buildFilterLabel('Tout', context),
                      buildFilterLabel('Discours', context),
                      buildFilterLabel('Histoire', context),
                      buildFilterLabel('Lettre Ouverte', context),
                      buildFilterLabel('Extraits', context),
                      buildFilterLabel('Xassidas', context),
                      buildFilterLabel('Livres', context),
                      buildFilterLabel('Poesie', context),
                    ],
                  ),

                  Padding(padding: EdgeInsets.only(top: 30)),
                  Row(
                    children: [
                      Text('Theme', style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),)
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
                  ),
                ],
              ),
            )
          ],
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
                    "Bibliothèque",
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
                     //padding: const EdgeInsets.all(5.0),
                     child: const Icon(Icons.search, color: Colors.white, size: 25,),
                   ),
                 ),
                 onChanged: (value) {
                   _filterBooks(value);
                 },
               )
          ),
              Container(
                padding: const EdgeInsets.only(top: 5.0, right: 20),
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
                itemCount: _filteredBooks.length,
                itemBuilder: (context, index) {
                 return Card(
                   elevation: 0,
                   color: const Color.fromRGBO(255, 255, 255, 1),
                   child: Container(
                     margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                       children: [
                         ListTile(
                           title: Text(
                               books[index].title,
                               style:
                               TextStyle(
                                 fontSize:22 ,
                                 fontWeight: FontWeight.w500,
                                 color: Color.fromRGBO(119,119,119,1),
                               )
                           ),
                           subtitle: Column(
                             children: [
                               Row(
                                 children: [
                                   Expanded(
                                     child: Text(
                                       books[index].author,
                                       style: TextStyle(
                                           color: Color.fromRGBO(29, 117, 189, 1),
                                           fontSize: 14,
                                           fontWeight: FontWeight.w400,
                                       ),
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ),
                                   const SizedBox(width: 90),
                                   Container(
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(5.0),
                                       color: Color.fromRGBO(250, 216, 125, 1),
                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 3, bottom: 3),
                                       child: Text(
                                         books[index].type,
                                         textAlign: TextAlign.center,
                                         style: const TextStyle(
                                           color: Color.fromRGBO(51, 51, 51, 1),
                                           fontSize: 13,
                                           fontWeight: FontWeight.w400,
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Container(
                                 alignment: Alignment.topLeft,
                                 child: Text(
                                   'posté le ${books[index].publicationDate}',
                                   style: TextStyle(
                                     color: Color.fromRGBO(153, 153, 153, 1),
                                     fontWeight: FontWeight.w400,
                                     fontSize: 12,
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         SizedBox(
                           height: MediaQuery.of(context).size.width * 0.7, // Ajuster la hauteur de l'image en fonction de la largeur de l'écran
                           child: ClipRRect(
                             borderRadius: BorderRadius.circular(10.0),
                             child: GestureDetector(
                               onTap: () {
                                 var route = MaterialPageRoute(builder: (BuildContext context) =>LectureScreen(book: books[index]));
                                 Navigator.of(context).push(route);
                               },
                               child: Image.asset(
                                 books[index].imageUrl,
                                 fit: BoxFit.cover,
                               ),
                             ),
                           ),
                         ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     IconButton(
                                       icon: SvgPicture.asset(AppIcons.heartIcons,
                                         color: books[index].isFavorite ? Colors.red : null,
                                       ),
                                       onPressed: () => toggleFavorite(index),
                                     ),
                                     Text(
                                       '${books[index].likes} Likes',
                                       style: TextStyle(
                                         color: Color.fromRGBO(0, 0, 0, 1),
                                         fontWeight: FontWeight.w400,
                                         fontSize: 12,
                                       ),
                                     ),
                                   ],
                                 ),

                                 Row(

                                   children: [
                                     IconButton(
                                       icon: SvgPicture.asset(AppIcons.shareIcons),
                                       onPressed: () {
                                         // Ajouter une logique pour partager le livre
                                       },
                                     ),
                                     IconButton(
                                       icon: SvgPicture.asset(AppIcons.favorisIcons),
                                       onPressed: () => likeBook(index),
                                     ),
                                   ],
                                 ),
                               ],
                            /* ),
                           ],*/
                         ),
                       ],
                     ),
                   ),
                 );

                },
              ),
            ),
          ),


            ],
      ),
    );
  }

}


