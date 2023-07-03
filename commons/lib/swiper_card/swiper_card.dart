import 'dart:math';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SwiperCard extends StatefulWidget {
  final String urlImage;
  final VoidCallback nextCard;
  final String petName;
  final VoidCallback onTapPet;
  final double height;
  const SwiperCard({
    Key? key,
    required this.urlImage,
    required this.nextCard,
    required this.onTapPet,
    this.petName = '',
    this.height = 550,
  }) : super(key: key);

  @override
  State<SwiperCard> createState() => _SwiperCardState();
}

class _SwiperCardState extends State<SwiperCard> {
  Offset position = Offset.zero;
  bool isDragging = false;
  double angle = 0;

  @override
  void initState() {
    super.initState();
  }

  void startPosition() {
    isDragging = true;
  }

  void updatePosition(DragUpdateDetails details, double screenWidth) {
    if (details.delta.dx > 0 || details.delta.dy > 20 || details.delta.dy < 0) {
      return;
    }
    position += details.delta;
    angle = position.dx * 45 / screenWidth;
    setState(() {});
  }

  void endPosition(double screenWidth) {
    isDragging = false;
    if (position.dx <= -250) {
      angle = 20;
      position -= Offset(screenWidth * 2, 0);
      widget.nextCard();
    } else {
      position = Offset.zero;
      angle = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final center = constraints.smallest.center(Offset.zero);
      final newAngle = angle * pi / 360;
      return GestureDetector(
        onTap: widget.onTapPet,
        onPanStart: (details) => startPosition(),
        onPanUpdate: (details) => updatePosition(details, constraints.maxWidth),
        onPanEnd: (_) => endPosition(constraints.maxWidth),
        child: AnimatedContainer(
          height: widget.height,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          duration: Duration(milliseconds: isDragging ? 0 : 400),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()
            ..translate(center.dx, center.dy)
            ..rotateZ(newAngle)
            ..translate(position.dx, position.dy),
          child: Container(
            height: widget.height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  widget.urlImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 65, bottom: 20),
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.petName,
                style: TextStyles.heading1.copyWith(color: Colors.white),

              ),
            ),
          ),
        ),
      );
    });
  }
}
