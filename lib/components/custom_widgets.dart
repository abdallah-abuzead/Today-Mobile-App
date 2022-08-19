import 'package:flutter/material.dart';
import '../app_data.dart';

Column logoText() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'To',
            style: TextStyle(color: AppData.mainColor, fontSize: 34, fontWeight: FontWeight.bold),
          ),
          Text(
            'day',
            style: TextStyle(color: AppData.primaryFontColor, fontSize: 34, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(height: 5),
      Text(
        'Project Management',
        textAlign: TextAlign.center,
        style:
            TextStyle(color: AppData.primaryFontColor, fontSize: 10, letterSpacing: 2.5, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Text smallText(String text, {double fontSize = 14}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: AppData.secondaryFontColor, fontWeight: FontWeight.w500, fontSize: fontSize),
  );
}

Text titleText(String text, {double fontSize = 30}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: AppData.primaryFontColor, fontSize: fontSize, fontWeight: FontWeight.bold),
  );
}

Container buildStarContainer() {
  return Container(
    width: 56,
    height: 56,
    padding: EdgeInsets.only(top: 10),
    child: Center(child: Text('*', style: TextStyle(fontSize: 37, color: Color(0XFFB6B7B7)))),
    decoration: BoxDecoration(color: Color(0XFFF2F2F2), borderRadius: BorderRadius.circular(15)),
  );
}
