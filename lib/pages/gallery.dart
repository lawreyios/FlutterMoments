import '../utils/colors.dart';
import '../utils/buttons.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Moments/scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:page_transition/page_transition.dart';

final List<String> imgList = [
  'assets/pic1.jpg',
  'assets/pic2.jpg',
  'assets/pic3.jpg',
  'assets/pic4.jpg',
  'assets/pic5.jpg'
];

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

final Widget placeholder = Container(color: Colors.grey);

List _getChildren() {
  // TODO #4: Implement List
  final List<String> images = imgList;
  return [];
}

List<T> map<T>(List list, Function handler) {
  final List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> images = imgList;
    // TODO #5: Implement Carousel
    return Column();
  }
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    final MainModel _model = ScopedModel.of(context);

    void _goToHomePage() {
      Navigator.push(
          context,
          PageTransition<MainPage>(
              type: PageTransitionType.downToUp, child: MainPage(_model)));
    }

    Widget _buildMomentsButton(BuildContext context) {
      // TODO #6: Implement Button
      return Center();
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0), // here the desired height
        child: AppBar(backgroundColor: kPlatinum, elevation: 0.0),
      ),
      backgroundColor: kPlatinum,
      // TODO #7: Implement Gallery
      body: Column(),
    );
  }
}
