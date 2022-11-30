import 'package:flutter/material.dart';
import 'package:tablaperiodicagame/pages/info_element.dart';
import '../Data/DataElement.dart';
import '../Data/element.dart';

class ElemetsTable extends StatelessWidget {
  const ElemetsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Elemento> TablaPeriodicaJson = getData();
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
                    itemCount: TablaPeriodicaJson.length,
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
                    itemBuilder: (context, index){
                      final elemento = TablaPeriodicaJson[index];
                      return Card(
                        color: Color.fromRGBO(30, 161, 116, 1.0),
                        margin: const EdgeInsets.all(8),
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [


                              Text(elemento.simbol,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 40,

                                ),
                              ),
                            ],
                          ),
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => InfoElement(indexValue: index, serie: elemento.serie))
                            );
                          },
                        ),
                      );

                    }
                )
            ),
          )
        ],
      )
    );
  }
}
