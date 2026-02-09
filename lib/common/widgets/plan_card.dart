import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({
    super.key,
    this.name = "",
    this.price = "",
    this.data = "",
    this.calls = "",
    this.sms = "",
    this.topLabel,
    this.note,
    this.periodLabel = "Month",
    this.width,
    this.backgroundColor = Colors.white,
    this.borderColor,
    this.showShadow = true,
    this.onTap,
  });

  final String name;
  final String price;
  final String data;
  final String calls;
  final String sms;
  final String? topLabel;
  final String? note;
  final String periodLabel;
  final double? width;
  final Color backgroundColor;
  final Color? borderColor;
  final bool showShadow;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const Color deepPurple = Color(0xFF4A3277);
    final Color effectiveBorderColor =
        borderColor ?? const Color(0xFF483073).withOpacity(0.1);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: effectiveBorderColor),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row: Tier/Region & Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (topLabel != null)
                      Text(
                        topLabel!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                          letterSpacing: 0.5,
                        ),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: deepPurple,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$$price",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: deepPurple,
                      ),
                    ),
                    Text(
                      "/$periodLabel",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Features Row (Bubbles)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _FeatureBubble(label: "DATA", value: data),
                const SizedBox(width: 12),
                _FeatureBubble(label: "CALLS", value: calls),
                const SizedBox(width: 12),
                _FeatureBubble(label: "SMS", value: sms),
              ],
            ),
            if (note != null) ...[
              const SizedBox(height: 10),
              Text(
                note!,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _FeatureBubble extends StatelessWidget {
  const _FeatureBubble({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7FA),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4A3277),
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1D1B20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
