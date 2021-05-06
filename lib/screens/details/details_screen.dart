import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnitureapp/models/Product.dart';
import 'package:furnitureapp/screens/details/components/body.dart';

import '../../constants.dart';
import '../../size_config.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: buildAppBar(context),
        body: Body(
          product: product,
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          'assets/icons/arrow-long-left.svg',
          height: SizeConfig.defaultSize * 1.5,
        ),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/bag.svg',
            height: SizeConfig.defaultSize * 2.8,
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: SizeConfig.defaultSize * 2,
        ),
      ],
    );
  }
}
