import 'package:flutter/material.dart';
import 'package:tecgrupo/src/views/pages/homePage/home_page.dart';

class TecGrupo extends StatelessWidget {
  const TecGrupo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TecGrupo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}