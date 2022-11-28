import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';

class Elemento{
  final String name;
  final int electrones;
  final String serie;
  final String simbol;
  final String masa;
  final String nombreDescubridor;

  Elemento({required this.name, required this.electrones, required this.serie, required this.simbol, required this.masa, required this.nombreDescubridor});

  factory Elemento.fromJson(Map<String, dynamic> json){
    return Elemento(
      name: json["nombre"],
      electrones: json["electrones"],
      serie: json["serie"],
      simbol: json["simbolo"],
      masa: json["masa"],
      nombreDescubridor: json["descubridor"]
    );
  }
}