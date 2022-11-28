import 'package:flutter/material.dart';
import 'package:tablaperiodicagame/Data/DataElement.dart';
import 'package:tablaperiodicagame/Data/element.dart';

class Propiedades extends StatelessWidget {
  final int indexValue;

  const Propiedades({Key? key, required this.indexValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Elemento> tablaPeriodicaJson = getData();
    return Container(
        width: 390,
        height: 844,
        decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 103,
                  left: 44,
                  child: Container(
                      width: 309,
                      height: 244,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(217, 217, 217, 1),
                      )
                  )
              ),Positioned(
                  top: 393,
                  left: 80.5,
                  child: Card(

                  )
              ),Positioned(
                  top: 408,
                  left: 167,
                  child: Text('Input Text', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 12,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 497,
                  left: 45,
                  child: Container(
                      width: 308,
                      height: 208,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(217, 217, 217, 1),
                      )
                  )
              ),Positioned(
                  top: 164,
                  left: 151,
                  child: Text(tablaPeriodicaJson[indexValue].masa, textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 128,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),
            ]
        )
    );
  }
}
