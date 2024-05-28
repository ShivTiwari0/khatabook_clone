import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:eassy_rokkad/res/themes/apptheme.dart';
import 'package:eassy_rokkad/res/themes/assets.dart';
import 'package:flutter/material.dart';

height(BuildContext context, double size) {
  return MediaQuery.of(context).size.height * size;
}

width(BuildContext context, double size) {
  return MediaQuery.of(context).size.width * size;
}

loadingWidget(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (ctx) {
      return SizedBox(
        width: 200,
        height: 100,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  strokeWidth: 2,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: font,
                    color: textColorred,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

textFieldDecoration({
  required String label,
  required IconData? icon,
  double borderRadius = 6,
  Widget? suffix,
}) {
  return InputDecoration(
    prefixIcon: icon == null
        ? null
        : Icon(
            icon,
          ),
    label: Text(
      label,
      style: const TextStyle(fontFamily: font, fontSize: 12),
    ),
    suffixIcon: suffix,
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 1),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColorred, width: 1),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
  );
}

customButtomBarButton(
    {required BuildContext context,
    required Function() ontap,
    required int curindex,
    required int index,
    required String icon,
    required String title}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      alignment: Alignment.center,
      width: width(context, 0.22),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: index == curindex ? tileBg : Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            height: 30,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              fontFamily: font,
              color: textColorblack,
            ),
          )
        ],
      ),
    ),
  );
}

datePicker(BuildContext context) async {
  final date = await showDatePickerDialog(
      context: context,
      initialDate: DateTime.now(),
      minDate: DateTime(1950, 1, 1),
      maxDate: DateTime(2100, 12, 31));

  return date;
}

searchbar(BuildContext context, String? hint, String? image) {
  return Container(
    width: width(context, 0.9),
    height: height(context, 0.07),
    padding: const EdgeInsets.only(left: 8, right: 8),
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: dividerColorgrey.withOpacity(0.4),
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
            ),
          ),
        ),
        Image.asset(
          image ?? search,
          height: 20,
        ),
      ],
    ),
  );
}
