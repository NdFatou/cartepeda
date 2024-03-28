import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../component/custom_appbar.dart';
import '../book/book_model.dart'; // Importer la classe Book
import '../book/list_book.dart';
import '../component/custom_drawer.dart';
import '../res/app_icons.dart'; // Importer la liste de livres

class LectureScreen extends StatefulWidget {
  @override
  _LectureScreenState createState() => _LectureScreenState();

  late final Book book;

  LectureScreen({required this.book});
}

class _LectureScreenState extends State<LectureScreen> {


  int likes = 0;
  bool isLiked = false;

  void _toggleLike() {
    setState(() {
      if (isLiked) {
        likes -= 1;
      } else {
        likes += 1;
      }
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(),
        drawer: const CustomDrawer(),
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Container(

                      decoration: BoxDecoration(
                        color: Color.fromRGBO(251, 251, 251, 1),
                      ),
                      child:
                      Card(
                          elevation: 0,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.7,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                        child: Image.asset(
                                          widget.book.imageUrl,
                                          fit: BoxFit.cover,
                                          height: 350,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: SvgPicture.asset(AppIcons.heartIcons,
                                                color: isLiked
                                                    ? Colors.red
                                                    : Colors.grey),
                                                onPressed: () {
                                                  _toggleLike();
                                                },
                                              ),

                                              IconButton(
                                                icon: SvgPicture.asset(AppIcons.commentIcons),
                                                onPressed: () {
                                                  // Action à effectuer lorsqu'on commente la photo
                                                },
                                              ),
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              IconButton(
                                                icon: SvgPicture.asset(AppIcons.shareIcons),
                                                onPressed: () {
                                                  // Action à effectuer lorsqu'on partage la photo
                                                },
                                              ),

                                              IconButton(
                                                icon:SvgPicture.asset(AppIcons.favorisIcons),
                                                onPressed: () {
                                                  // Action à effectuer lorsqu'on ajoute aux favoris
                                                },
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 20.0, right: 20.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(5.0),
                                              color: Color.fromRGBO(
                                                  250, 216, 125, 1),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 3, bottom: 3),
                                              child: Text(
                                                widget.book.type,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      51, 51, 51, 1),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ListTile(
                                      title: Text(
                                          widget.book.title,
                                          style:
                                          TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(
                                                119, 119, 119, 1),
                                          )
                                      ),
                                      subtitle: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  widget.book.author,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        29, 117, 189, 1),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                ),
                                              ),

                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'posté le ${widget.book
                                                  .publicationDate}',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Action à effectuer lorsqu'on télécharge le PDF
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromRGBO(29,117 ,189 ,1 ), // Couleur de fond
                                          ),
                                          child: Text(
                                            'Télécharger le PDF',
                                            style: TextStyle(
                                                color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16
                                            ), // Couleur du texte
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(
                                        16.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            'Description',
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            widget.book.description,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ]
                              )
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}