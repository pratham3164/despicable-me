import 'package:flutter/material.dart';
import 'package:ui/const/style.dart';
import 'package:ui/model/character.dart';

class CharacterDetail extends StatefulWidget {
  final Character character;
  CharacterDetail(this.character);

  @override
  _CharacterDetailState createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: 'back-${widget.character.name}',
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: widget.character.colors,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft))),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 40,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                Align(
                  alignment: Alignment(0.9, -0.6),
                  child: Hero(
                    tag: widget.character.name,
                    child: Image.asset(widget.character.imagePath,
                        height: screenHeight * 0.45),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: Hero(
                    tag: 'name-${widget.character.name}',
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        child: Text(
                          widget.character.name,
                          style: AppTheme.heading1,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 90),
                  child: Text(
                    widget.character.description,
                    style: AppTheme.subheading1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
