import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:furnitureapp/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductInformations extends StatelessWidget {
  const ProductInformations({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double defualtSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.5));
    return Container(
      height: defualtSize * 37.7,
      width: defualtSize * 15,
      padding: EdgeInsets.symmetric(horizontal: defualtSize * 2),
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${product.category}'.toUpperCase(),
            style: lightTextStyle,
          ),
          SizedBox(height: defualtSize),
          Text(
            product.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: defualtSize * 2.4,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.8,
              height: 1.4,
            ),
          ),
          SizedBox(height: defualtSize),
          Text(
            'Form',
            style: lightTextStyle,
          ),
          Text(
            '\$${product.price}',
            style: TextStyle(
              fontSize: defualtSize * 2.6,
              fontWeight: FontWeight.bold,
              height: 1.6,
            ),
          ),
          SizedBox(height: defualtSize),
          Text('Available Colors', style: lightTextStyle),
          Row(
            children: [
              buildColorBox(defualtSize, color: Color(0xfff7ba272), isActive: true),
              buildColorBox(defualtSize, color: Color(0xfff7d7d7d)),
              buildColorBox(defualtSize, color: kTextColor),
            ],
          ),
        ],
      ),
    );
  }

  Container buildColorBox(
    double defualtSize, {
    Color color,
    bool isActive = false,
  }) {
    return Container(
      height: defualtSize * 2.6,
      width: defualtSize * 2.6,
      margin: EdgeInsets.only(top: defualtSize, right: defualtSize),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: isActive ? SvgPicture.asset("assets/icons/check.svg") : SizedBox(),
    );
  }
}
