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
  double paddingTransfer = 80;

   GameElement({Key? key, required this.indexValue}) : super(key: key);
  List<Elemento> TablaPeriodicaJson = getData();



  @override
  Widget build(BuildContext context) {
    int indexTrans = indexValue+1;

    List<Elemento> tablaPeriodicaJson = getData();
    return Scaffold(
        appBar: AppBar(
          title: Text('Nivel $indexTrans'
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
                  top: 10,
                  left: 20,
                  right: 20,
                  bottom: 180,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, paddingTransfer, 5, 0),
                      width: 450,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(35, 178, 197, 1.0),                       /* image: DecorationImage(
                          image: AssetImage(
                              'assets/fondo_ejercicio.png'),
                        )*/
                      ),



                    child: Column(

                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children:[

                              if (mostrar) Expanded(child:Text(tablaPeriodicaJson[indexValue].electrones.toString(), textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 60,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                            ), ),
                              if (mostrar) Text(tablaPeriodicaJson[indexValue].masa.toString(), textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Inter',
                            fontSize: 30,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                        )
  ]
                        ),

                        Align(
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
                        if (mostrar) Align(
                            alignment: Alignment.center,
                            child: Text('Lo descubrio :'+tablaPeriodicaJson[indexValue].nombreDescubridor, textAlign: TextAlign.center, style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 24,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),)
                        ),
                      ]
                  ),
              ),


            ), Positioned(
                top: 280,
                left: 20,
                right: 20,
                bottom: 120,
                child: Container(
                  width: 309,
                  height: 244,
                  decoration: BoxDecoration(
                    color : Color.fromRGBO(199, 229, 111, 1.0),

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
                          splashColor: Colors.deepPurple,
                          minWidth: 200.0,
                          height: 40.0,
                          onPressed: () {

                 mostrar = true;
                 paddingTransfer = 5;
                 (context as Element).markNeedsBuild();

                          },
                          color: Color.fromRGBO(124, 236, 191, 1.0),

                          child: Text('Ayuda', style: TextStyle(color: Colors.black)),
                        ),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                      ),
                      Expanded(
                        child: MaterialButton(
                          splashColor: Colors.yellow,
                          minWidth: 200.0,
                          height: 40.0,
                          onPressed: () {
                            revisarRespuesta(context);
                          },

                          color: Color.fromRGBO(72, 121, 90, 1.0),
                          child: Text('Revisar', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],

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
                Navigator.pop(context);
                Navigator.pop(context);


                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameElement( indexValue:indexValue+1,)));
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

