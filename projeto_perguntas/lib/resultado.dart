import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(
              child: Text('Parabens!',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      );
    
  }
}