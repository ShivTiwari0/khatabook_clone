import 'package:flutter/material.dart';

class Btab1 extends StatelessWidget {
  const Btab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
