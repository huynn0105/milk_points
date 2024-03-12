import 'package:flutter/material.dart';

class RoundedLinearProgress extends StatefulWidget {
  const RoundedLinearProgress({
    super.key,
    this.width = 70.0,
    this.strokeWidth,
    this.bgColor,
    this.fgColor,
    this.duration = const Duration(seconds: 2),
  });

  final double width;
  final double? strokeWidth;
  final Color? bgColor;
  final Color? fgColor;
  final Duration duration;

  @override
  State<StatefulWidget> createState() => _RoundedLinearProgressState();
}

class _RoundedLinearProgressState extends State<RoundedLinearProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressAnimator(
      controller: _controller,
      width: widget.width,
      bgColor: widget.bgColor,
      fgColor: widget.fgColor,
      strokeWidth: widget.strokeWidth,
    );
  }
}

class LinearProgressAnimator extends StatelessWidget {
  LinearProgressAnimator({
    super.key,
    required controller,
    required this.width,
    this.strokeWidth,
    this.bgColor,
    this.fgColor,
  }) : animation = LinearProgressAnimation(
          animationController: controller,
        );

  // mandatory parameters
  final LinearProgressAnimation animation;
  final double width;

  // optional parameters
  final double? strokeWidth;
  final Color? bgColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.animationController,
      builder: (BuildContext context, Widget? child) {
        return SizedBox(
          width: width,
          height: 0,
          child: CustomPaint(
            painter: LinearProgressPaint(
              scaleX: animation.scaleX.value,
              positionX: animation.positionX.value,
              fgColor: fgColor ?? Colors.white,
              bgColor: bgColor ?? Colors.blue,
              strokeWidth: strokeWidth ?? 3.0,
            ),
          ),
        );
      },
    );
  }
}

class LinearProgressAnimation {
  LinearProgressAnimation({
    required this.animationController,
  })  : positionX =
            Tween<double>(begin: 0, end: 90).animate(animationController),
        scaleX = TweenSequence([
          TweenSequenceItem(
            tween: Tween<double>(begin: 10, end: 40)
                .chain(CurveTween(curve: Curves.easeIn)),
            weight: 40.0,
          ),
          TweenSequenceItem(
            tween: Tween<double>(begin: 40, end: 10)
                .chain(CurveTween(curve: Curves.decelerate)),
            weight: 60.0,
          ),
        ]).animate(animationController);
  final AnimationController animationController;
  final Animation<double> scaleX;
  final Animation<double> positionX;
}

class LinearProgressPaint extends CustomPainter {
  LinearProgressPaint({
    required this.scaleX,
    required this.positionX,
    required this.bgColor,
    required this.fgColor,
    this.strokeWidth = 3.0,
  });
  final double scaleX;
  final double positionX;
  final Color bgColor;
  final Color fgColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    // canvas height and width
    double cW = size.width;

    double positionPercentage = cW * (positionX / 100);
    double scalePercentage = cW * (scaleX / 100);

    Paint paint = Paint()
      ..color = bgColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.square;

    Paint paint2 = Paint()
      ..color = fgColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    Path path1 = Path()
      ..moveTo(0, 0)
      ..lineTo(cW, 0);

    Path path2 = Path()
      ..moveTo(positionPercentage, 0)
      ..lineTo(positionPercentage + scalePercentage, 0);

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(LinearProgressPaint oldDelegate) {
    return oldDelegate.positionX != positionX || oldDelegate.scaleX != scaleX;
  }
}
