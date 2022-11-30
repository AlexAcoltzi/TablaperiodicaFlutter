import 'package:flutter/material.dart';
import '../Data/DataElement.dart';
import '../Data/element.dart';

class InfoElement extends StatelessWidget {
  final int indexValue;
  final String serie;

  const InfoElement({Key? key, required this.indexValue, required this.serie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Elemento> tabla = getData();
    final elemento = tabla[indexValue];
    final nombre = elemento.name;
    final serielement = serie;
    final simbolo = elemento.simbol;
    final numeroAtomico = elemento.electrones;
    final masa = elemento.masa;
    final descubridor = elemento.nombreDescubridor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Información del elemento'),
      ),
      body: Container(
          width: 500,
          height: 700,
          decoration: BoxDecoration(
            color : Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Stack(
              children: <Widget>[
                Positioned(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: 20,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 30, 5, 0),

                      width: 300,
                        height: 450,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),

                          ),
                          color : getColor(serie),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                                child: Text('Simbolo: $simbolo', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 34,
                                    letterSpacing: 5 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 2
                                ),)
                            ),
                            Align(
                              alignment: Alignment.center,
                                child: Text('Nombre: $nombre', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 30,
                                    letterSpacing: 2 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5
                                ),)
                            ),
                            Align(
                              alignment: Alignment.center,
                                child: Text('Serie: $serielement', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 28,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5
                                ),)
                            ),
                            Align(
                              alignment: Alignment.center,
                                child: Text('Número atomico: $numeroAtomico', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 28,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5
                                ),)
                            ),
                            Align(
                              alignment: Alignment.center,
                                child: Text('Masa atomica: $masa', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Inter',
                                    fontSize:20,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5
                                ),)
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text('Nombre del descubridor: $descubridor', textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 24,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5
                              ),
                              ),
                            )

                          ],
                        ),

                    )
                )
              ]
          )
      ),
    );
  }
}

Color getColor(String serie){
  switch(serie){
    case 'gases nombles':
      return Colors.green.shade800;
    case 'halogenos':
      return Colors.lightGreenAccent;
    case 'no metales':
      return Colors.deepOrange;
    case 'metaloides':
      return Colors.red;
    case 'metales del bloque p':
      return Colors.purple;
    case 'metales de transicion':
      return Colors.blueAccent;
    case 'alcalinoterreos':
      return Colors.orangeAccent;
    case 'metales alcalinos':
      return Colors.black54;
    case 'lantanidos':
      return Colors.lightGreen.shade300;
    case 'actinidos':
      return Color.fromRGBO(80, 136, 65, 1);
  }
  return Colors.green;
}
