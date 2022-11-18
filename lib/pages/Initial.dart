import 'package:flutter/material.dart';

import 'home.dart';

class InicialPage extends StatelessWidget {
  const InicialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360,
        height: 800,
        decoration: BoxDecoration(
          //color : Color.fromRGBO(139, 195, 74, 1),
            image: DecorationImage(
              image: AssetImage(
                  'assets/fondo_inicio.png'),

            )        ),
        child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 68,
                  //left: 28,
                  child: Container(
                      width: 260,
                      height: 245,
                      decoration: BoxDecoration(
                        //color : Color.fromRGBO(217, 217, 217, 1),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/img.png'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius : BorderRadius.all(Radius.elliptical(275, 260)),
                      )
                  )
              ),
              Positioned(
                top: 330,
                //left: 60,
                child: MaterialButton(
                  onPressed: () {   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );  },
                  minWidth: 200.0,
                  height: 40.0,
                  color: Colors.lightBlue,
                  child: Text('INICIAR', style: TextStyle(color: Colors.white)),
                ),
              ),
              Positioned(
                  top: 490,
                  //left: 155,
                  child: Text('Buap', textAlign: TextAlign.center, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Open Sans',
                      fontSize: 14,
                      letterSpacing: 0.75,
                      fontWeight: FontWeight.normal,
                      height: 1.1428571428571428
                  ),)
              ),
              Positioned(
                  top: 505,
                  //left: 135,
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
