// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipe_app/ui/ui.dart';

class RatingButton extends StatelessWidget {
  final int rating;
  final bool isSelected;
  final VoidCallback? onTap;

  const RatingButton({
    super.key,
    required this.rating,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: !isSelected ? ColorStyles.primary80 : Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
          color: !isSelected ? ColorStyles.white : ColorStyles.primary100,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$rating',
              style: TextStyles.smallerTextRegular.copyWith(
                color: !isSelected ? ColorStyles.primary80 : ColorStyles.white,
              ),
            ),
            const SizedBox(width: 5),
            Image.asset(
              'assets/icons/green_star.png',
              width: 18,
              height: 18,
              color: !isSelected ? ColorStyles.primary80 : ColorStyles.white,
            ),
          ],
        ),
      ),
    );
  }
}
