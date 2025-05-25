import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final double begin;
  final double end;

  const FadeIn({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.curve = Curves.easeInOut,
    this.begin = 0.0,
    this.end = 1.0,
  }) : super(key: key);

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ).drive(Tween<double>(begin: widget.begin, end: widget.end));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
} 