import 'package:flutter/material.dart';

import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/ui/ui.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  final bool? isDetail;
  final VoidCallback? onTap;
  const RecipeCard({
    super.key,
    required this.recipe,
    this.onTap,
    this.isDetail = false,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            // 1. 배경 이미지
            Positioned.fill(
              child: Image.network(widget.recipe.imageUrl, fit: BoxFit.cover),
            ),

            // 2. 이미지 위에 덮는 gradient
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      ColorStyles.black, // 원하는 컬러와 투명도 조절 가능
                    ],
                  ),
                ),
              ),
            ),
            if (widget.isDetail != null ? !widget.isDetail! : true)
              Positioned(
                left: 10,
                bottom: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final nameWidth = constraints.maxWidth * 0.635;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: nameWidth,
                                child: Text(
                                  widget.recipe.name,
                                  style: TextStyles.smallTextBold.copyWith(
                                    color: ColorStyles.white,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                widget.recipe.chef,
                                style: TextStyles.smallTextSmallLabel.copyWith(
                                  color: ColorStyles.gray4,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Row(
                children: [
                  Image.asset('assets/icons/timer.png', width: 17, height: 17),
                  const SizedBox(width: 5),
                  Text(
                    widget.recipe.totalTimeMinutes,
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: ColorStyles.gray4,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorStyles.white,
                      ),
                      child: Image.asset(
                        'assets/icons/book_mark.png',
                        width: 17,
                        height: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: ColorStyles.secondary20,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/icons/star.png', width: 8, height: 8),
                      const SizedBox(width: 3),
                      Text(
                        '${widget.recipe.rating}',
                        style: TextStyles.smallTextSmallLabel,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
