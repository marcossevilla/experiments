import 'package:experiments/app_localizations.dart';
import 'package:experiments/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/canvas_painter.dart';

class PaintPage extends StatefulWidget {
  static const String routeName = 'paint';

  const PaintPage({Key key}) : super(key: key);

  @override
  _PaintPageState createState() => _PaintPageState();
}

class _PaintPageState extends State<PaintPage> {
  double strokeWidth;
  List<DrawingArea> points = [];

  @override
  void initState() {
    super.initState();
    strokeWidth = 2.0;
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text(localizations.translate('home.paint'))),
      body: Stack(
        children: [
          _buildBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildCanvas(height, width),
                _buildPaintController(width),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _buildPaintController(double width) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Consumer<ThemeProvider>(
        builder: (context, state, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: state.useDarkTheme ? Colors.black26 : Colors.white,
            ),
            width: width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: Icon(Icons.color_lens), onPressed: () {}),
                Slider(
                  max: 15.0,
                  min: 1.0,
                  value: strokeWidth,
                  onChanged: (value) => setState(() => strokeWidth = value),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => setState(() => points.clear()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Consumer _buildCanvas(double height, double width) {
    return Consumer<ThemeProvider>(
      builder: (context, state, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            height: height * 0.7,
            width: width * 0.8,
            color: state.useDarkTheme ? Colors.black26 : Colors.white,
            child: GestureDetector(
              onPanDown: (details) {
                setState(() {
                  points.add(
                    DrawingArea(
                      point: details.localPosition,
                      areaPaint: Paint()
                        ..strokeCap = StrokeCap.round
                        ..strokeWidth = strokeWidth,
                    ),
                  );
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  points.add(
                    DrawingArea(
                      point: details.localPosition,
                      areaPaint: Paint()
                        ..strokeCap = StrokeCap.round
                        ..strokeWidth = strokeWidth,
                    ),
                  );
                });
              },
              onPanEnd: (details) {
                setState(() => points.add(null));
              },
              child: CustomPaint(
                painter: CanvasCustomPainter(points, strokeWidth),
              ),
            ),
          ),
        );
      },
    );
  }

  Container _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomCenter,
          colors: [Colors.purple, Colors.deepPurple],
        ),
      ),
    );
  }
}

class DrawingArea {
  Offset point;
  Paint areaPaint;

  DrawingArea({this.point, this.areaPaint});
}
