import 'package:flutter/material.dart';

import '../book/book_model.dart';
import '../book/list_book.dart';


class getSearchBar extends StatefulWidget {
  const getSearchBar({super.key});

  @override
  State<getSearchBar> createState() => _getSearchBarState();

}

class _getSearchBarState extends State<getSearchBar> {
 /* List<Book> _filteredBooks = [];

   _filterBooks(String searchText) {
    setState(() {
      _filteredBooks = books.where((book) {
        final titleLower = book.title.toLowerCase();
        final authorLower = book.author.toLowerCase();
        final searchLower = searchText.toLowerCase();
        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        
    );
  }
}
