import 'package:flutter/material.dart';
import 'package:tablaperiodicagame/pages/info_element.dart';
import '../Data/DataElement.dart';
import '../Data/element.dart';

class ElemetsTable extends StatelessWidget {
  const ElemetsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Elemento> TablaPeriodicaJson = getData();
    return GridView.builder(
        itemCount: TablaPeriodicaJson.length,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index){
          final elemento = TablaPeriodicaJson[index];
          return Card(
            color: Color.fromRGBO(179, 2255, 179, 1),
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(elemento.simbol,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
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
    );
  }
}
