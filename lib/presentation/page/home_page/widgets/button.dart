part of '../home_page.dart';

class _ButtonItem extends StatelessWidget {
  const _ButtonItem({
    super.key,
    required this.image,
    required this.onTap,
    this.iconColor,
  });
  final String image;
  final VoidCallback onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return AppSplashButton(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: UIColors.extraLightGray,
        ),
        padding: const EdgeInsets.all(12),
        child: AppImage.asset(
          asset: image,
          width: 25,
          height: 25,
          color: iconColor,
        ),
      ),
    );
  }
}
