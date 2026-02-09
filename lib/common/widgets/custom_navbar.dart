import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final double width;
  final double height;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final double bubbleSize = (height * 0.72).clamp(24, 46);
    final double iconSize = (height * 0.4).clamp(18, 24);

    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        width: width,
        height: height,
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: const Color(0xFF4A3277),
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(
              0,
              Icons.home_outlined,
              Icons.home,
              bubbleSize,
              iconSize,
            ),
            _buildNavItem(
              1,
              Icons.public_outlined,
              Icons.public,
              bubbleSize,
              iconSize,
            ),
            _buildNavItem(
              2,
              Icons.person_outline,
              Icons.person,
              bubbleSize,
              iconSize,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData iconOutline,
    IconData iconFilled,
    double bubbleSize,
    double iconSize,
  ) {
    bool isSelected = selectedIndex == index;

    // FIX: Expanded is now the PARENT of GestureDetector
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            width: bubbleSize,
            height: bubbleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? const Color(0xFFE8DEF8) : Colors.transparent,
            ),
            child: Icon(
              isSelected ? iconFilled : iconOutline,
              color: isSelected ? const Color(0xFF1D1B20) : Colors.white,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
