part of '../home_page.dart';

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: () {},
      elevation: 1,
      buttonColor: UIColors.white,
      height: 36,
      widget: Row(
        children: [
          SizedBox(
            width: 160,
            child: Text(
              'Thời gian vừa tạo',
              style: UITextStyles.regular(14),
            ),
          ),
          const Icon(
            Icons.arrow_drop_down_rounded,
            size: 30,
          )
        ],
      ),
    );
  }
}
