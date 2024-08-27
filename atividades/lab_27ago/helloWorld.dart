/*
  Exercício 1 - Hello World
  Receber o nome do usuário e imprimir na tela.

  @owner: @catfmcastro
  LDDM 2024_2
*/

import 'dart:io';

void main() {
  print("Olá User!");

  stdout.write("Seu nome: ");
  String? name = stdin.readLineSync();

  print("Olá $name");
}