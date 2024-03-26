part of '../home_page.dart';

class _AddCustomerButton extends StatelessWidget {
  const _AddCustomerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      buttonColor: UIColors.green,
      onPressed: () {
        DialogProvider.instance.show(
          context: context,
          child: const _AddCustomerDialog(),
        );
      },
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

class _AddCustomerDialog extends StatefulWidget {
  const _AddCustomerDialog({
    super.key,
  });

  @override
  State<_AddCustomerDialog> createState() => _AddCustomerDialogState();
}

class _AddCustomerDialogState extends State<_AddCustomerDialog> {
  late final TextEditingController fullNameController,
      addressController,
      phoneNumberController,
      pointController,
      pointLonController,
      debtController;

  @override
  void initState() {
    fullNameController = TextEditingController();
    addressController = TextEditingController();
    phoneNumberController = TextEditingController();
    pointController = TextEditingController();
    pointLonController = TextEditingController();
    debtController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    pointController.dispose();
    pointLonController.dispose();
    debtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: UIColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thêm khách hàng mới',
            style: UITextStyles.medium(20),
          ),
          const Divider(
            height: 20,
          ),
          const SizedBox(height: 20),
          UITextFieldOutline(
            hintText: 'Tên khách hàng',
            title: 'Tên khách hàng',
            controller: fullNameController,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: UITextFieldOutline(
                  hintText: 'Số điện thoại',
                  title: 'Số điện thoại',
                  controller: phoneNumberController,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: UITextFieldOutline(
                  hintText: 'Địa chỉ',
                  title: 'Địa chỉ',
                  controller: addressController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Divider(),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: UITextFieldOutline(
                  hintText: 'Điểm thường',
                  title: 'Điểm thường',
                  controller: pointController,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: UITextFieldOutline(
                  hintText: 'Điểm lon',
                  title: 'Điểm lon',
                  controller: pointLonController,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: UITextFieldOutline(
                  hintText: 'Nợ',
                  title: 'Nợ',
                  controller: debtController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PrimaryButton(
                onPressed: () {
                  context.back();
                },
                title: 'Hủy bỏ',
                buttonColor: UIColors.gray,
              ),
              const SizedBox(width: 20),
              PrimaryButton(
                onPressed: () {
                  context.read<CustomerBloc>().add(
                        AddNewCustomerEvent(
                          customer: CustomerModel(
                            id: const Uuid().v4(),
                            name: fullNameController.text,
                            address: addressController.text,
                            phoneNumber: phoneNumberController.text,
                            totalPoint: int.tryParse(pointController.text) ?? 0,
                            totalPointLon:
                                int.tryParse(pointLonController.text) ?? 0,
                            totalPointByYear:
                                int.tryParse(pointController.text) ?? 0,
                            debtAmount: int.tryParse(debtController.text) ?? 0,
                            updateTime: DateTime.now(),
                            createTime: DateTime.now(),
                          ),
                        ),
                      );
                },
                title: 'Tạo khách hàng',
              ),
            ],
          )
        ],
      ),
    );
  }
}
