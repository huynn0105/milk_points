part of '../home_page.dart';

class _Divider extends StatelessWidget {
  const _Divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Divider(
        height: 1,
        color: UIColors.divider,
      ),
    );
  }
}
