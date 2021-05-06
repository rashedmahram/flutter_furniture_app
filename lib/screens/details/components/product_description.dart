import 'package:flutter/material.dart';
import 'package:furnitureapp/constants.dart';
import 'package:furnitureapp/models/Product.dart';
import 'package:furnitureapp/size_config.dart';

class ProductDiscreption extends StatelessWidget {
  const ProductDiscreption({
    Key key,
    @required this.product,
    this.press,
  }) : super(key: key);
  final Function press;
  final Product product;

  @override
  Widget build(BuildContext context) {
    double defualtSize = SizeConfig.defaultSize;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defualtSize * 2),
      constraints: BoxConstraints(minHeight: defualtSize * 44),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: defualtSize * 9, //90
          left: defualtSize * 2, //20
          right: defualtSize * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.subTitle,
              style: TextStyle(
                fontSize: defualtSize * 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: defualtSize * 2),
            Text(
              '${product.description}',
              style: TextStyle(
                color: kTextColor.withOpacity(0.5),
                height: 1.6,
              ),
            ),
            SizedBox(height: defualtSize * 3),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                color: kPrimaryColor,
                onPressed: press,
                padding: EdgeInsets.all(defualtSize * 2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: defualtSize * 1.6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
