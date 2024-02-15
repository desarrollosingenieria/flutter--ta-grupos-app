import 'package:flutter/material.dart';
import 'package:tagrupo/src/views/pages/homePage/home_page.dart';

class TAGrupo extends StatelessWidget {
  const TAGrupo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TA Grupo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}