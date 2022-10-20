import 'package:e_commer/screens/home_pages/products_list_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () async {
              await GoogleSignIn().signOut();
              await FirebaseAuth.instance.signOut();
            },
            child: const Icon(Icons.exit_to_app),
          ),
        ),
        body: const ProductsListWidget());
  }
}
