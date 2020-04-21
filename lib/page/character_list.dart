import 'package:flutter/material.dart';
import 'package:ui/const/style.dart';
import 'package:ui/model/character.dart';
import 'package:ui/widget/character_widget.dart';

class CharacterList extends StatefulWidget {
  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  PageController _pageController;
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: index, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.arrow_back_ios),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.search, size: 25),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(bottom: 0.05 * screenWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(text: 'Despicable Me\n', style: AppTheme.display1),
                    TextSpan(text: 'Characters', style: AppTheme.display2),
                  ])),
                ),
                Expanded(
                    child: PageView.builder(
                  controller: _pageController,
                  itemCount: characters.length,
                  itemBuilder: (context, i) => CharacterWidget(characters[i],
                      pagecontroller: _pageController, index: i),
                ))
              ],
            ),
          )),
    );
  }
}
