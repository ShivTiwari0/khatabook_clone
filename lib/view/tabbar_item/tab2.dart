import 'package:flutter/material.dart';

class ITab2 extends StatelessWidget {
  const ITab2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return const Row(
            children: [
              Text('data'),
              Text(
                '₹10',
                style: TextStyle(
                  fontFamily: 'Poppins_SemiBold',
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0,
                  color: Color(0xFF333333),
                ),
              )
            ],
          );
        });
  }
}
