import 'package:app_ui/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.onFavoriteTap,
    super.key,
    this.isFavorite = false,
  });

  final VoidCallback? onFavoriteTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isFavorite ? AppColors.primaryLighter : AppColors.grayLighter,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            color: isFavorite ? AppColors.primary : AppColors.gray,
          ),
          onPressed: onFavoriteTap,
        ),
      ),
    );
  }
}
