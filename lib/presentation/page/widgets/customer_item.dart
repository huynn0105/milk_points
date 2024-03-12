part of '../home_page.dart';

class _CustomerItem extends StatelessWidget {
  const _CustomerItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return AppSplashButton(
      onTap: () {
        debugPrint('item tap');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _Info(
                index: index,
                name: 'Nguyễn Nhật Huy',
                address: 'Hoà Mỹ Đông, Phú Nhiêu',
                phoneNumber: '090909090',
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: _ItemRow(
                          title: 'Điểm',
                          subTitle: '160',
                        ),
                      ),
                      Expanded(
                        child: _ItemRow(
                          title: 'Điểm Lon',
                          subTitle: '10',
                        ),
                      ),
                      Expanded(
                        child: _ItemRow(
                          title: 'Nợ',
                          subTitle: '130 000k',
                          textColor: UIColors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      NoPaddingCheckbox(
                        value: false,
                        onChanged: (_) {},
                        activeColor: UIColors.purple,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '2023: ',
                        style: UITextStyles.regular(16).copyWith(
                          color: UIColors.purple,
                        ),
                      ),
                      Text(
                        '100',
                        style: UITextStyles.medium(16).copyWith(
                          color: UIColors.purple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                _ButtonItem(
                  image: 'ic_add',
                  iconColor: UIColors.green,
                  onTap: () {
                    debugPrint('edit tap');
                  },
                ),
                // const SizedBox(width: 10),
                // _ButtonItem(
                //   image: 'ic_edit',
                //   iconColor: UIColors.orange,
                //   onTap: () {
                //     debugPrint('edit tap');
                //   },
                // ),
                const SizedBox(width: 10),
                _ButtonItem(
                  image: 'ic_delete',
                  onTap: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
