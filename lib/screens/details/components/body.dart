import 'package:flutter/material.dart';
import 'package:furnitureapp/models/Product.dart';
import 'package:furnitureapp/screens/details/components/product_description.dart';
import 'package:furnitureapp/screens/details/components/product_info.dart';
import 'package:furnitureapp/size_config.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defualtSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.5));
    bool screenStateLandscape = SizeConfig.orientation == Orientation.landscape;
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
            width: double.infinity,
            height: screenStateLandscape ? SizeConfig.screenWidth : SizeConfig.screenHeight - AppBar().preferredSize.height,
            child: Stack(
              children: [
                ProductInformations(product: product),
                Positioned(
                  top: defualtSize * 37.5,
                  left: 0,
                  right: 0,
                  child: ProductDiscreption(press: () {}, product: product),
                ),
                Positioned(
                  top: screenStateLandscape ? defualtSize * 1.4 : defualtSize * 9.4,
                  right: screenStateLandscape ? defualtSize * 1.4 : -defualtSize * 6.3,
                  child: Hero(
                    tag: product.id,
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                      height: defualtSize * 37.80,
                      width: defualtSize * 37.80,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
