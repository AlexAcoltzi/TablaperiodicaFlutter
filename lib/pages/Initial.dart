import 'package:flutter/material.dart';

class InicialPage extends StatelessWidget {
  const InicialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360,
        height: 800,
        decoration: BoxDecoration(
          color : Color.fromRGBO(139, 195, 74, 1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 68,
                  left: 43,
                  child: Container(
                      width: 275,
                      height: 260,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(217, 217, 217, 1),
                        borderRadius : BorderRadius.all(Radius.elliptical(275, 260)),
                      )
                  )
              ),
              Positioned(
                child: ButtonBar(
                  children: [
                    Text('Home')
                  ],
                ),
              ),
              Positioned(
                  top: 623,
                  left: 155,
                  child: Text('Buap', textAlign: TextAlign.center, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Open Sans',
                      fontSize: 14,
                      letterSpacing: 0.75,
                      fontWeight: FontWeight.normal,
                      height: 1.1428571428571428
                  ),)
              ),Positioned(
                  top: 704,
                  left: 155,
                  child: Text('Version 1.0', textAlign: TextAlign.center, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Open Sans',
                      fontSize: 14,
                      letterSpacing: 0.75,
                      fontWeight: FontWeight.normal,
                      height: 1.1428571428571428
                  ),)
              ),
            ]
        )
    );
  }
}
