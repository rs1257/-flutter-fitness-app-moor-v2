import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:preferences/preferences.dart';

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget>
    with TickerProviderStateMixin {
  AnimationController controller;
  int _durationInSecs;
  Duration _duration;

  String get timerString {
    final Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _durationInSecs = 30;
    _duration = Duration(seconds: _durationInSecs);
    controller = AnimationController(vsync: this, duration: _duration)
      ..addStatusListener((state) {
        if (state == AnimationStatus.dismissed) {
          FlutterRingtonePlayer.playAlarm();
          Future.delayed(
              Duration(
                  milliseconds:
                      getIntFromSettings('timer_dismiss_time') * 1000), () {
            FlutterRingtonePlayer.stop();
          });
          controller.duration = _duration;
        }
      });
  }

  int getIntFromSettings(String settingName) {
    return int.parse(PrefService.get(settingName).toString());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updateDuration(int amount) {
    print(_duration);
    if (_durationInSecs + amount < 0) {
        setState(() {
          _durationInSecs = 0;
        });
      } else {
        setState(() {
          _durationInSecs = _durationInSecs + amount;
        });
      }
    
    _duration = Duration(seconds: _durationInSecs);
    if (!controller.isAnimating) {
      controller.duration = _duration;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  createTimerButton(5, '++'),
                  createTimerButton(1, '+'),
                  createTimerButton(-1, '-'),
                  createTimerButton(-5, '--')
                ]),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Timer Amount: ${_duration.inMinutes}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            return CustomPaint(
                                painter: TimerPainter(
                              animation: controller,
                              backgroundColor: Colors.white,
                              color: themeData.indicatorColor,
                            ));
                          },
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Count Down',
                              style: themeData.textTheme.subhead,
                            ),
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Text(
                                    timerString,
                                    style: themeData.textTheme.display4,
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget child) {
                        return Icon(controller.isAnimating
                            ? Icons.pause
                            : Icons.play_arrow);
                      },
                    ),
                    onPressed: () {
                      if (controller.isAnimating) {
                        controller.stop(canceled: true);
                      } else {
                        controller.reverse(
                            from: controller.value == 0.0
                                ? 1.0
                                : controller.value);
                      }
                    },
                  )
                ],
              ),
            ),
            ButtonTheme(
              minWidth: 70.0,
              height: 50.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: RaisedButton(
                onPressed: () {
                  controller.duration = _duration;
                  controller.reset();
                },
                child: const Text('Reset',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ButtonTheme createTimerButton(int durationChange, String btnLabel){
    return ButtonTheme(
        minWidth: 70.0,
        height: 50.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: RaisedButton(
          onPressed: () {
            updateDuration(5);
          },
          child: Text(btnLabel,
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ),
      );
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({this.animation, this.backgroundColor, this.color})
      : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    final double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter oldDelegate) {
    return animation.value != oldDelegate.animation.value ||
        color != oldDelegate.color ||
        backgroundColor != oldDelegate.backgroundColor;
  }
}
