import 'package:flutter/cupertino.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class tablaImage extends StatelessWidget {
  const tablaImage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(

     child: PinchZoom(
        child: Image.network('https://www.periodni.com/gallery/tabla_periodica-4k-3840x2160-fondo_claro.png'),
        resetDuration: const Duration(milliseconds: 1000),
        maxScale: 3.5,
        onZoomStart: (){print('Start zooming');},
        onZoomEnd: (){print('Stop zooming');},
      ),
    );
  }

}
