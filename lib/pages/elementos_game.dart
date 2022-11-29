import 'package:flutter/material.dart';
import 'package:tablaperiodicagame/Data/DataElement.dart';
import 'package:tablaperiodicagame/Data/element.dart';
import 'package:diacritic/diacritic.dart';
import 'package:tablaperiodicagame/pages/home_page_propiedades.dart';
import 'package:tablaperiodicagame/pages/propiedades_game.dart';

class GameElement extends StatelessWidget {
  final int indexValue;
  bool mostrar = false;
  final myController = TextEditingController();

   GameElement({Key? key, required this.indexValue}) : super(key: key);
  List<Elemento> TablaPeriodicaJson = getData();



  @override
  Widget build(BuildContext context) {
      List<Elemento> tablaPeriodicaJson = getData();
    return Scaffold(
        appBar: AppBar(
          title: Text('Nivel'
      ),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
        decoration: BoxDecoration(

          color : Color.fromRGBO(226, 229, 221, 1.0),

        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 20,
                  right: 20,
                  bottom: 190,
                  child: Container(
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/fondo_ejercicio.png'),
                        )
                      ),
                      child: Align(
                    alignment: Alignment.center,
                    child: Text(tablaPeriodicaJson[indexValue].simbol, textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 128,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),)
                  ),
              ),


            ), Positioned(
                top: 260,
                left: 20,
                right: 20,
                bottom: 140,
                child: Container(
                  width: 309,
                  height: 244,
                  decoration: BoxDecoration(
                    color : Color.fromRGBO(128, 255, 125, 1.0),

                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: TextField(
                        controller: myController,
                        textAlign: TextAlign.center,
                        decoration:  InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Ingresa el nombre del elemento'

                        ),


                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Inter',
                          fontSize: 12,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w700,
                          height: 1
                      ),)
                  ),


                ),


              ),

            Positioned(
                  top: 340,
                  left: 20,
                right: 20,
                bottom: 70
                ,
                  child: Row(
                    children:  <Widget> [

                      Expanded(
                        child: MaterialButton(
                          minWidth: 200.0,
                          height: 40.0,
                          onPressed: () {
                 mostrar = true;
                 (context as Element).markNeedsBuild();

                          },
                          color: Colors.lightBlue,
                          child: Text('Ayuda', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                      ),
                      Expanded(
                        child: MaterialButton(
                          minWidth: 200.0,
                          height: 40.0,
                          onPressed: () {
                            revisarRespuesta(context);
                          },

                          color: Colors.green,
                          child: Text('Revisar', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],

                  )
              ),
              if (mostrar) Positioned(
                  top: 30,
                  left: 30,
                  right: 20,
                  bottom: 20
                  ,
                  child: Container(
                      width: 308,
                      height: 208,
                      child: Text(tablaPeriodicaJson[indexValue].electrones.toString(), textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 60,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                      )
                  )
              ),
              if (mostrar) Positioned(
                  top: 30,
                  left: 200,
                  right: 10,
                  bottom: 20
                  ,
                  child: Container(
                      width: 308,
                      height: 208,
                      child: Text(tablaPeriodicaJson[indexValue].masa, textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Inter',
                          fontSize: 24,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                      )
                  )
              ),
              if (mostrar) Positioned(
                  top: 180,
                  left: 20 ,
                  right: 20,
                  bottom: 20
                  ,
                  child: Container(
                      width: 308,
                      height: 208,
                      child: Text('Lo descubrio '+ tablaPeriodicaJson[indexValue].nombreDescubridor, textAlign: TextAlign.center, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Inter',
                          fontSize: 24,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1,
                          ),
                      )
                  )
              ),

            ]
        )
    ),
    );
  }

  bool revisarRespuesta(BuildContext context){
    var nuevoNombre = removeDiacritics(TablaPeriodicaJson[indexValue].name);
    var nuevaEntrada = myController.text;
    nuevoNombre.toLowerCase();
    nuevaEntrada.toLowerCase();
    var comparado = ((nuevoNombre.toLowerCase()).compareTo(nuevaEntrada.toLowerCase()));

    if(comparado == 0){
      _showDialog(context);
    }else{
      _showDialogError(context);
    }
    return true;
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Tu respuesta es correcta"),
          content: new Text(myController.text),
          actions: <Widget>[
            new ElevatedButton(
              child: new Text("Siguiente nivel"),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => GameElement( indexValue:indexValue+1,)), (Route<dynamic> route) => route.isCurrent );
                ;},
            ),
          ],
        );
      },
    );
  }
  void _showDialogError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Respuesta incorrecta"),
          content: new Text(myController.text),
          actions: <Widget>[
            new ElevatedButton(
              child: new Text("volver a intentar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

