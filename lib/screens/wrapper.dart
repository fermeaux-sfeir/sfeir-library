import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfeir_library/models/user.dart';
import 'package:sfeir_library/screens/authenticate/authenticate.dart';
import 'package:sfeir_library/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    return user != null ? Home() : Authenticate();
  }
}
