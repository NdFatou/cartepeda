// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../book/book_model.dart';
import '../book/list_book.dart';
import '../component/custom_appbar.dart';
import '../component/custom_drawer.dart';
import '../res/app_icons.dart';


enum _types {All, Discours, Histoire, Lettre_ouverte, Extrait, Xassida, Livre, Poesie }
enum _themes { Education, Tidjanya, Fikh, Jeunesse, Religion, Politique, Vertu, Spiritualite }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 /* void toggleFavorite(int index) {
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
  String _searchText = '';

  Set<_types> filters = <_types>{};


  String _selectedType = 'All';
  String _selectedTheme = 'All';

  @override
  void initState() {
    _filteredBooks.addAll(books);
    super.initState();
  }

  void _filterBooks(String query) {
    setState(() {
      _searchText = query;
      _selectedType = query;
      _selectedTheme = query;
      _filteredBooks = books
          .where((book) =>
      book.title.toLowerCase().contains(query.toLowerCase()) ||
          book.author.toLowerCase().contains(query.toLowerCase()))
          .where((book) =>
      _selectedType == 'All' || book.type == _selectedType)
          .where((book) =>
      _selectedType == 'All' || book.theme == _selectedTheme)
          .toList();
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(),
        drawer: CustomDrawer(),
       /* body: Column(
          children: [
          const SizedBox(
          height: 30,
        ),
      const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Bibliothèques",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(51, 51, 51, 1)),
            )
          ],
        ),

      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'œuvre, auteur...',
              hintStyle: const TextStyle(
                  color: Color.fromRGBO(153, 153, 153, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(29, 117, 189, 1),
                ),
                padding: const EdgeInsets.all(8.0),
                child: const Icon(Icons.search, color: Colors.white),
              ),
            ),
            onChanged: (value) {
              _filterBooks(value);
            },
          )
      ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                      IconButton(
                        icon: Icon(
                          Icons.,
                        ),
                        onPressed: () {
                           Wrap(
                            spacing: 5.0,
                            children: _types.values.map((_types exercise) {
                              return FilterChip(
                                label: Text(exercise.name),
                                selected: filters.contains(exercise),
                                onSelected: (bool selected) {
                                  setState(() {
                                    if (selected) {
                                      filters.add(exercise);
                                    } else {
                                      filters.remove(exercise);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          );
                        },
                      ),



                 /* DropdownButton<String>(
                    value: _selectedType,
                    onChanged: (value) {
                      setState(() {
                        _selectedType = value!;
                        _filterBooks(_selectedType);
                      });
                    },
                    items: _types.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 16.0),
                  DropdownButton<String>(
                    value: _selectedTheme,
                    onChanged: (value) {
                      setState(() {
                        _selectedTheme = value!;
                        _filterBooks(_selectedTheme);
                      });
                    },
                    items:
                    _themes.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),*/
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
      margin: const EdgeInsets.all(8.0),
      width: 318,
      height: 410,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text(books[index].title),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        books[index].author,
                        style: TextStyle(color: Colors.blue[900]),
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
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 2),
                        child: Text(
                          '${books[index].type}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 1),
                            fontSize: 13,
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
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              books[index].imageUrl,
              fit: BoxFit.cover,
              height: 260,
              width: 340,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center, // Centrer le ButtonBar
            children: [
              IconButton(
                icon: Icon(
                  books[index].isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: books[index].isFavorite ? Colors.red : null,
                ),
                onPressed: () => toggleFavorite(index),
              ),
              Text('${books[index].likes} Likes'),
              SizedBox(width: 130),
              IconButton(
                icon: SvgPicture.asset(AppIcons.shareIcons),
                onPressed: () {
                  // Ajouter une logique pour explorer le livre
                },
              ),
              IconButton(
                icon: SvgPicture.asset(AppIcons.favorisIcons),
                onPressed: () => likeBook(index),
              ),
            ],
          ),
        ],
      ),
    ),
  );


    }),
            )
          ),
            ]
        )*/
            );
  }
}
