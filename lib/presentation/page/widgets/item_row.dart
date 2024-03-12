part of '../home_page.dart';

class _ItemRow extends StatelessWidget {
  const _ItemRow({
    super.key,
    required this.title,
    required this.subTitle,
    this.textColor,
  });
  final String title;
  final String subTitle;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: UITextStyles.regular(14).copyWith(
            color: UIColors.grayText,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subTitle,
          style: UITextStyles.medium(20).copyWith(color: textColor),
        ),
      ],
    );
  }
}
