import 'package:flutter/material.dart';
import 'package:tablaperiodicagame/pages/propiedades_game.dart';

import 'elementos_game.dart';

class InicioProp extends StatelessWidget {
  const InicioProp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 390,
        height: 844,
        decoration: BoxDecoration(
          color : Color.fromRGBO(231, 231, 231,1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 20,
                  left: 8,
                  right: 8,
                  bottom:20,
                  child: Container(
                    width: 314,
                    height: 185,
                    decoration: BoxDecoration(
                      borderRadius : BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color : Color.fromRGBO(179, 2255, 179, 1),
                    ),
                    child: GridView.builder(
                      itemCount: 20,
                      padding: const EdgeInsets.all(8),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent (maxCrossAxisExtent: 150),
                      itemBuilder: (BuildContext context, int index){
                        int indexTransformed = index + 1;
                        print('_builderGridViewBuilder $index');

                        return Card(
                          color: Colors.lightGreen.shade50,
                          margin: const EdgeInsets.all(8),

                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    //color : Color.fromRGBO(217, 217, 217, 1),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icono.png'),
                                    ),
                                  ),
                                ),
                                const Divider(),
                                Text(
                                  'Nivel $indexTransformed',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            onTap: (){
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Propiedades(indexValue: index))
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
              ),
            ]

        )

    );
  }
}
