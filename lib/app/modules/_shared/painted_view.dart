import 'package:flutter/material.dart';
import 'package:stainless_v2/app/modules/_shared/page_painter.dart';

class PaintedView extends StatelessWidget {
  final Widget child;
  final bool upPainting;
  final bool downPainting;

  const PaintedView(
      {Key key, this.upPainting = true, this.downPainting = true, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          CustomPaint(
            painter:
                PagePainter(downPainting: downPainting, upPainting: upPainting),
          ),
          child
        ],
      ),
    );
  }
}
