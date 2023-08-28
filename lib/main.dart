import 'package:crud_operation/app/routes/routes_configure.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    initialRoute: 'homepage',
    onGenerateRoute: AppRoutesConfiure.generateRoutes,
    debugShowCheckedModeBanner: false,
    title: "crud Operation",
  ));
}
