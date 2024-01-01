import 'package:flutter/material.dart';
import 'package:music_player/utils/base/base_utils_export.dart';
import 'package:music_player/utils/base/helpers/music_colors.dart';

class IndicatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MusicColors.pink
      ..strokeWidth = 3.0;

    final startPoint = Offset(0, size.height / 2);
    final endPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

typedef OnChanged = ValueChanged<double>?;
class MIndicator extends StatefulWidget {
  MIndicator({
    super.key,
    required this.isExpanded,
    required this.lineWidth,
    this.onChanged,
  });

  final double lineWidth;
  bool isExpanded = false;
  OnChanged onChanged;
  

  @override
  State<MIndicator> createState() => _MIndicatorState();
}

class _MIndicatorState extends State<MIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.extralong1,
    );
    _animation = Tween<double>(begin: 2.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutExpo,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    setState(() {
      widget.isExpanded = !widget.isExpanded;
      widget.isExpanded
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    // MusicProvider provider = MusicProvider.watch(context);
    return GestureDetector(
      onTap: _toggleAnimation,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            children: [
              GestureDetector(
                /*onTapUp: (details) {
                  provider.onSliderValueChanged(details.localPosition.dx);
                },*/
                child: AnimatedContainer(
                  duration: Durations.extralong1,
                  width: widget.isExpanded ? _animation.value : widget.lineWidth,
                  height: 3.0,
                  child: CustomPaint(
                    painter: IndicatorPainter(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
