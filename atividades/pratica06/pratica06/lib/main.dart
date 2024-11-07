/*
  Pratica 06 - Shared Preferences

  @owner: @catfmcastro - Catarina F. M. Castro
  LDDM 2024_2
*/

import 'package:flutter/material.dart';
import 'Login.dart';
import 'App.dart';

void main() {
  runApp(MaterialApp(
    title: "Prática 06 - Shared Preferences",
    routes: 
    {
      '/': (context) => Login(),
      '/home': (context) => App(),
    },
  ));
}
