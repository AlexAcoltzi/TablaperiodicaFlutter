import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:tablaperiodicagame/Data/DataElement.dart';
import 'package:tablaperiodicagame/Data/element.dart';

class Propiedades extends StatelessWidget {
  final int indexValue;
  bool mostrar = false;
  final myController = TextEditingController();
  final myControlerNumAt = TextEditingController();

  double paddingTransfer = 80;
   Propiedades({Key? key, required this.indexValue}) : super(key: key);
  List<Elemento> TablaPeriodicaJson = getData();


  @override
  Widget build(BuildContext context) {
    List<Elemento> tablaPeriodicaJson = getData();
    int indexTrans = indexValue+1;
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
                  bottom: 200,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 50, 5, 0),
                    width: 300,
                    height: 100,
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
                          Align(
                              alignment: Alignment.center,
                              child: Text(tablaPeriodicaJson[indexValue].name, textAlign: TextAlign.center, style: TextStyle(
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
                  top: 260,
                  left: 20,
                  right: 20,
                  bottom: 60,

                  child: Column(
                    children: [
                       Container(
                        width: 300,
                        height: 50,
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
                                  hintText: 'Ingresa la masa del elemento'

                              ), style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.w700,
                                  height: 1
                              ),)
                        ),


                      ),
                      Container(
                        width: 300,
                        height: 5,
                      ),
                      Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          color : Color.fromRGBO(211, 93, 93, 1.0),

                        ),

                        child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              controller: myControlerNumAt,
                              textAlign: TextAlign.center,
                              decoration:  InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Ingresa el numero atomico del elemento'

                              ), style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.w700,
                                height: 1
                            ),)
                        ),


                      ),

                    ],
                  ),



                ),

                Positioned(
                    top: 340,
                    left: 20,
                    right: 20,
                    bottom: -10,
                    child: Row(
                      children:  <Widget> [

                        Container(
                          width: 10,
                          height: 10,
                        ),

                        Expanded(
                          child: MaterialButton(
                            minWidth: 200.0,
                            height: 40.0,
                            splashColor: Colors.yellow,

                            onPressed: () {
                              revisarRespuesta(context);
                            },

                            color: Color.fromRGBO(72, 121, 90, 1.0),
                            child: Text('Revisar', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          width: 10,
                          height: 10,
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
    var nuevoNumetoAt = removeDiacritics((TablaPeriodicaJson[indexValue].electrones).toString());
    var nuevoMasa = removeDiacritics((TablaPeriodicaJson[indexValue].masa).toString());

    var masaElemento = myController.text;
    var numeroAtomico = myControlerNumAt.text;
    numeroAtomico.toLowerCase();
    nuevoNumetoAt.toLowerCase();
    masaElemento.toLowerCase();
    var comparadoNumAt= ((nuevoNumetoAt.toLowerCase()).compareTo(numeroAtomico.toLowerCase()));
    var comparadoMasa = ((nuevoMasa.toLowerCase()).compareTo(masaElemento.toLowerCase()));

    if(comparadoNumAt == 0 && comparadoMasa == 0 ){
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
                    MaterialPageRoute(builder: (context) => Propiedades( indexValue:indexValue+1,)));
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

