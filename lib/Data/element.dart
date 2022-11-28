import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';

class Elemento{
  final String name;
  final String simbol;
  final int atomicNomber;

  Elemento({required this.name, required this.simbol, required this.atomicNomber});

  factory Elemento.fromJson(Map<String, dynamic> json){
    return Elemento(
      name: json["nombre"],
      simbol: json["simbolo"],
      atomicNomber:json["electrones"]
    );
  }
}