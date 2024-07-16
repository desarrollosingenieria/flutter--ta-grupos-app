import 'package:flutter/material.dart';
import 'package:tagrupos/core/constants/constants.dart';
import 'package:tagrupos/src/communication/presentation/views/pages/communication_page.dart';

class TAGrupos extends StatelessWidget {
  const TAGrupos({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CommunicationPage()
    );
  }
}