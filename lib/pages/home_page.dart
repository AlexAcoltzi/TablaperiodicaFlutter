import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

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
                  top: 50,
                  left: 38,
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
                      )
                  )
              ),Positioned(
                  top: 311,
                  left: 38,
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
                      )
                  )
              ),
            ]
        )
    );
  }
}
