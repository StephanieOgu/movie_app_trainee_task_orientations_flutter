import 'package:flutter/material.dart';

class Temp extends StatelessWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Expanded(
              child: Container(
                color: Colors.red,
              ),
            );
          } else {
            return
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                      width: 2 * MediaQuery.of(context).size.width / 3,
                    ),
                  ),
                ],
              );
          }
        }));
  }
}
