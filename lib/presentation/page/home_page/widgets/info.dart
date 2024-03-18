part of '../home_page.dart';

class _Info extends StatelessWidget {
  const _Info({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.index,
  });

  final String name;
  final String phoneNumber;
  final String address;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Index(index: index),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: UITextStyles.bold(18),
            ),
            const SizedBox(height: 6),
            Text(
              phoneNumber,
              style: UITextStyles.regular(15),
            ),
            const SizedBox(height: 6),
            Text(
              address,
              style: UITextStyles.regular(15),
            ),
          ],
        ),
      ],
    );
  }
}

class _Index extends StatelessWidget {
  const _Index({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: UIColors.brightBlue,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      width: 36,
      height: 36,
      alignment: Alignment.center,
      child: Text(
        '${index + 1}',
        style: UITextStyles.medium(14).copyWith(
          color: UIColors.brightBlue,
        ),
      ),
    );
  }
}
