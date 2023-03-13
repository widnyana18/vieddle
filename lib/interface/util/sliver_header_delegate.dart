import 'package:flutter/material.dart';
import 'dart:math' as math;

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate({
    double minHeight,
    double maxHeight,
    @required this.child,
  })  : this.minHeight = minHeight ?? Size.infinite.height,
        this.maxHeight = maxHeight ?? Size.infinite.height;

  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: Material(
        color: Colors.white,
        elevation: overlapsContent ? 8 : 0,
        child: child,
      ),
    );
  }

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
