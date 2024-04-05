import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CustomStaggerColumn extends StatelessWidget {
  const CustomStaggerColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirections,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
  });

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirections;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 375),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: children,
        ),
      ),
    );
  }
}

class CustomStaggerGridView extends StatelessWidget {
  const CustomStaggerGridView({
    super.key,
    required this.columnCount,
    required this.length,
    required this.generator,
  });
  final int length;
  final int columnCount;

  final Widget Function(int) generator;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.count(
        crossAxisCount: columnCount,
        children: List.generate(
          length,
          (int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: columnCount,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: generator(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomStaggerListView extends StatelessWidget {
  const CustomStaggerListView({
    super.key,
    this.controller,
    required this.itemCount,
    required this.itemBuilder,
    this.separatorBuilder,
    this.padding = EdgeInsets.zero,
  });
  final int itemCount;
  final ScrollController? controller;
  final EdgeInsets? padding;
  final Widget Function(int) itemBuilder;
  final Widget Function(int)? separatorBuilder;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
        controller: controller,
        itemCount: itemCount,
        padding: padding,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: itemBuilder(index),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: separatorBuilder == null
                    ? const SizedBox.shrink()
                    : separatorBuilder!(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
