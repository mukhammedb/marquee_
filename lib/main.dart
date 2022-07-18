import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _useRtlText = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marquee',
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: ListView(
          padding: const EdgeInsets.only(top: 50),
          children: [
            _buildMarquee(),
            _buildComplexMarquee(),
          ].map(_wrapWithStuff).toList(),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => setState(() => _useRtlText = !_useRtlText),
          label: !_useRtlText
              ? const Text('Switch to Kyrgyz')
              : const Text('Англисчеге которул'),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }

  Widget _buildMarquee() {
    return Marquee(
      key: Key("$_useRtlText"),
      text: !_useRtlText
          ? 'There once was a boy who told this story about a boy: "'
          : 'Бир жолу бир бала бул окуяны айтып берген экен .',
      velocity: 50.0,
    );
  }

  Widget _buildComplexMarquee() {
    return Marquee(
      key: Key("$_useRtlText"),
      text: !_useRtlText
          ? 'Some sample text that takes some space.'
          : 'Бир аз орун алган кээ бир үлгү текст.',
      style: const TextStyle(fontWeight: FontWeight.bold),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20,
      velocity: 100,
      pauseAfterRound: const Duration(seconds: 1),
      showFadingOnlyWhenScrolling: false,
      fadingEdgeStartFraction: 0.1,
      fadingEdgeEndFraction: 0.1,
      numberOfRounds: 3,
      startPadding: 10,
      // accelerationDuration: const Duration(seconds: 1),
      // accelerationCurve: Curves.linear,
      // decelerationDuration: const Duration(milliseconds: 500),
      // decelerationCurve: Curves.easeOut,
      // textDirection: _useRtlText ? TextDirection.rtl : TextDirection.ltr,
    );
  }

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(height: 50, color: Colors.white, child: child),
    );
  }
}
