import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

AppBar buildAppBar() {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/icons/menu.svg',
        height: SizeConfig.defaultSize * 2,
      ),
    ),
    actions: [
      IconButton(
        icon: SvgPicture.asset(
          'assets/icons/scan.svg',
          height: SizeConfig.defaultSize * 2.4,
        ),
        onPressed: () {},
      ),
      Center(
        child: Text(
          'Scan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(width: SizeConfig.defaultSize),
    ],
  );
}
