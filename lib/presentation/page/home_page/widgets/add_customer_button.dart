part of '../home_page.dart';

class _AddCustomerButton extends StatelessWidget {
  const _AddCustomerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: () {},
      widget: Row(
        children: [
          const AppImage.asset(
            asset: 'ic_add_user',
            color: UIColors.white,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 6),
          Text(
            'Thêm khách hàng',
            style: UITextStyles.medium(14).copyWith(
              color: UIColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
