import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ui/const/style.dart';
import 'package:ui/model/character.dart';
import 'package:ui/widget/character_details.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  final PageController pagecontroller;
  final int index;
  CharacterWidget(this.character, {this.pagecontroller, this.index});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 350),
                pageBuilder: (context, __, _) => CharacterDetail(character)));
      },
      child: AnimatedBuilder(
          animation: pagecontroller,
          builder: (context, child) {
            double value = 1;
            if (pagecontroller.position.haveDimensions) {
              value = pagecontroller.page - index;
              print('vale $value');

              value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
              print(value);
            }

            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: CharacterClipper(),
                    child: Hero(
                      tag: 'back-${character.name}',
                      child: Container(
                          height: screenHeight * 0.55,
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: character.colors,
                          ))),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, -0.5),
                  child: Hero(
                    tag: character.name,
                    child: Image.asset(character.imagePath,
                        height: screenHeight * 0.55 * value),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.1, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Hero(
                        tag: 'name-${character.name}',
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            child: Text(
                              character.name,
                              style: AppTheme.heading1,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Click to read more',
                        style: AppTheme.subheading1,
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}

class CharacterClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clipped = Path();
    const curveDistance = 40;
    clipped.moveTo(0.0, size.height * 0.4);
    clipped.lineTo(0.0, size.height - curveDistance);
    clipped.quadraticBezierTo(
        0.0, size.height, 0.0 + curveDistance, size.height);
    clipped.lineTo(size.width - curveDistance, size.height);
    clipped.quadraticBezierTo(
        size.width, size.height, size.width, size.height - curveDistance);
    clipped.lineTo(size.width, 0.0 + curveDistance);
    clipped.quadraticBezierTo(size.width - 1, 0.0,
        size.width - 5 - curveDistance, 0.0 + curveDistance / 3);
    clipped.lineTo(0.0 + curveDistance, size.height * 0.29);
    clipped.quadraticBezierTo(
        1.0, size.height * 0.30 + 10, 0.0, size.height * 0.4);

    clipped.close();
    return clipped;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
