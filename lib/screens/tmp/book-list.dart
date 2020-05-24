import 'package:flutter/material.dart';
import 'package:sfeir_library/constants.dart';

class BookList extends StatelessWidget {
  const BookList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Book> books = [
      new Book('Edna O\'Brien', 'Clean Code', 'assets/images/clean_code.jpg'),
      new Book(
          'Edna O\'Brien', 'The Clean Coder', 'assets/images/clean_coder.jpg'),
      new Book('Edna O\'Brien', 'The Design of Everyday Things',
          'assets/images/design_of_everyday_things.jpg'),
      new Book('Edna O\'Brien', 'Girl', 'assets/images/book_lover.png'),
      new Book('Edna O\'Brien', 'Girl', 'assets/images/book_lover.png'),
      new Book('Edna O\'Brien', 'Girl', 'assets/images/book_lover.png'),
      new Book('Edna O\'Brien', 'Girl', 'assets/images/book_lover.png'),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text('Favorites'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/book_lover.png'),
                      alignment: Alignment.bottomRight,
                      fit: BoxFit.fitHeight),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Good\nAfternoon,',
                        style: TextStyle(
                            color: kPink,
                            fontSize: 18,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Diane Lane',
                        style: TextStyle(fontSize: 26),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: TextField(
                  cursorColor: kPink,
                  decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.black26),
                      hintText: 'Search for books...'),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'New Arrivals',
                        style: TextStyle(fontSize: 24),
                      ),
                      Row(children: [
                        Text(
                          'View All',
                          style: TextStyle(color: kPink),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: kPink,
                        )
                      ]),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 15,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final bookPreview = BookPreview(
                        title: books[index].title,
                        author: books[index].author,
                        previewImagePath: books[index].imagePath,
                      );
                      if (index == 0) {
                        return Container(
                          margin: EdgeInsets.only(left: 25),
                          child: bookPreview,
                        );
                      } else if (index == books.length - 1) {
                        return Container(
                          margin: EdgeInsets.only(right: 25),
                          child: bookPreview,
                        );
                      }
                      return bookPreview;
                    },
                    itemCount: books.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class BookPreview extends StatelessWidget {
  final String title;
  final String author;
  final String previewImagePath;

  const BookPreview({Key key, this.title, this.author, this.previewImagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 8,
                spreadRadius: -10,
                offset: Offset(0, 14),
              )
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 150,
                width: double.infinity,
                child: Image(
                  image: AssetImage(previewImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            author,
            style: TextStyle(fontSize: 12, color: Colors.black38),
          )
        ],
      ),
    );
  }
}

class Book {
  String author;
  String title;
  String imagePath;

  Book(this.author, this.title, this.imagePath);

  @override
  String toString() {
    return '{ ${this.title}, ${this.author} }';
  }
}
