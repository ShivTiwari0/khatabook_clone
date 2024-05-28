import 'package:eassy_rokkad/res/themes/apptheme.dart';
import 'package:flutter/material.dart';

class Btab2 extends StatelessWidget {
  const Btab2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> itemCategories = ['All Items', 'Low Stocks'];
    List<String> selectedItem = [];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: itemCategories
                .map((itemCategory) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        label: Text(itemCategory),
                        onSelected: (selected) {},
                      ),
                    ))
                .toList(),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          height: 40,
          color: const Color(0xFFF6F7FB),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MY ITEMS',
                style: TextStyle(
                  fontFamily: font,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.4,
                  color: textColortitle,
                ),
              ),
              Text(
                '1 ITEM ADDED',
                style: TextStyle(
                  fontFamily: font,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.4,
                  color: textColortitle,
                ),
              )
            ],
          ),
        ),
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
