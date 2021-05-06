import 'package:flutter/material.dart';
import 'package:furnitureapp/components/title_text.dart';
import 'package:furnitureapp/screens/home/components/categories.dart';
import 'package:furnitureapp/screens/home/components/recomanded_products.dart';
import 'package:furnitureapp/services/fetchCategories.dart';
import 'package:furnitureapp/services/fetchProduct.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(title: "Brows By Category"),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) =>
                  snapshot.hasData ? Categories(categories: snapshot.data) : Center(child: Image.asset('assets/ripple.gif')),
            ),
            Divider(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(title: 'Recomended Items'),
            ),
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecomandedScroller(products: snapshot.data)
                    : Center(
                        child: Image.asset(
                          'assets/ripple.gif',
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
