import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class SimpleScrollView extends StatefulWidget {
  const SimpleScrollView({super.key});

  @override
  State<SimpleScrollView> createState() => _SimpleScrollViewState();
}

class _SimpleScrollViewState extends State<SimpleScrollView> {
  late final FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent / 2,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          OverflowBox(
            alignment: Alignment.center,
            maxHeight: MediaQuery.sizeOf(context).width * 1.5,
            child: RotatedBox(
              quarterTurns: -1,
              child: ListWheelScrollView(
                physics: const FixedExtentScrollPhysics(),
                controller: _scrollController,
                itemExtent: 92,
                renderChildrenOutsideViewport: true,
                offAxisFraction: 0.2,
                clipBehavior: Clip.none,
                onSelectedItemChanged: (_) => HapticFeedback.lightImpact(),
                children: List.generate(
                  1000,
                  (index) => RotatedBox(
                    quarterTurns: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(16),
                        elevation: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/nature_${(index % 13) + 1}.jpg',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.15,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0),
                ],
                stops: const [0, 1],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.15,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.white.withOpacity(0),
                    Colors.white,
                  ],
                  stops: const [0, 1],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
