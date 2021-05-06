import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:furnitureapp/components/title_text.dart';
import 'package:furnitureapp/models/Categories.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.category,
  }) : super(key: key);

  final Category category;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: SizedBox(
        width: defaultSize * 25.5,
        child: AspectRatio(
          aspectRatio: 0.83,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: AspectRatio(
                  aspectRatio: 1.025,
                  child: Container(
                    padding: EdgeInsets.all(defaultSize * 2),
                    color: kSecondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleText(title: category.title),
                        SizedBox(height: defaultSize),
                        Text(
                          '${category.numOfProducts}+ Products',
                          style: TextStyle(
                            color: kTextColor.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/spinner.gif",
                    image: category.image,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double hight = size.height;
    double width = size.width;
    double cornerSize = 40;

    path.lineTo(0, hight - cornerSize);
    path.quadraticBezierTo(0, hight, cornerSize, hight);

    path.lineTo(width - cornerSize, hight);
    path.quadraticBezierTo(width, hight, width, hight - cornerSize);

    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);

    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);
    // path.lineTo(width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
