import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sfeir_library/constants.dart';
import 'package:sfeir_library/screens/tmp/book-list.dart';
import 'package:sfeir_library/services/auth.dart';

import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Sfeir Library',
        theme: ThemeData(
            scaffoldBackgroundColor: kScaffoldColor,
            primaryColor: kPink,
            textTheme: GoogleFonts.robotoTextTheme(
              Theme.of(context).textTheme,
            )),
        home: BookList(),
      ),
    );
  }
}
