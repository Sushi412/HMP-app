import 'package:flutter/material.dart';
import 'package:gradient_progress_indicator/gradient_progress_indicator.dart';

// class loadingSpinner extends StatelessWidget {
//   const loadingSpinner({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: GradientProgressIndicator(
//         radius: 40,
//         duration: 1,
//         strokeWidth: 6,
//         gradientStops: [
//           0.0,
//           1,
//         ],
//         gradientColors: [
//           Color.fromRGBO(58, 225, 128, 0),
//           Color.fromRGBO(25, 54, 105, 1),
//         ],
//         child: SizedBox.shrink(),
//       ),
//     );
//   }
// }

Future loadingSpinner(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: GradientProgressIndicator(
          radius: 40,
          duration: 1,
          strokeWidth: 6,
          gradientStops: [
            0.0,
            1,
          ],
          gradientColors: [
            Color.fromRGBO(58, 225, 128, 0),
            Color.fromRGBO(25, 54, 105, 1),
          ],
          child: SizedBox.shrink(),
        ),
      );
    },
  );
}
