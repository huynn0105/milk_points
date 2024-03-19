import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_points/data/models/customer_model.dart';
import 'package:milk_points/presentation/bloc/customer_detail_cubit/customer_detail_cubit.dart';
import 'package:milk_points/presentation/common/buttons.dart';
import 'package:milk_points/presentation/common/colors.dart';
import 'package:milk_points/presentation/common/images.dart';
import 'package:milk_points/presentation/common/loading.dart';
import 'package:milk_points/presentation/common/textfield.dart';
import 'package:milk_points/presentation/common/textstyle.dart';
import 'package:milk_points/presentation/common/widget_layout.dart';
import 'package:milk_points/utils/bloc_status.dart';

@RoutePage()
class CustomerDetailPage extends StatefulWidget {
  const CustomerDetailPage({
    super.key,
    @QueryParam('customer') required this.customer,
  });
  final CustomerModel? customer;

  @override
  State<CustomerDetailPage> createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  late TextEditingController fullNameController,
      phoneNumberController,
      addressController,
      totalPointController,
      totalPointLonController,
      debtAmountController,
      totalPointOfYearController;

  @override
  void initState() {
    fullNameController = TextEditingController(text: widget.customer?.name);
    phoneNumberController =
        TextEditingController(text: widget.customer?.phoneNumber);
    addressController = TextEditingController(text: widget.customer?.address);
    totalPointController =
        TextEditingController(text: widget.customer?.totalPoint.toString());
    totalPointLonController =
        TextEditingController(text: widget.customer?.totalPointLon.toString());
    debtAmountController =
        TextEditingController(text: widget.customer?.debtAmount.toString());
    totalPointOfYearController = TextEditingController(
        text: widget.customer?.totalPointByYear.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.lightBlue,
      body: BlocBuilder<CustomerDetailCubit, CustomerDetailState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  WidgetLayout(
                    color: UIColors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Text(
                            'Chi tiết khách hàng',
                            style: UITextStyles.regular(22).copyWith(
                              color: UIColors.brightBlue,
                            ),
                          ),
                          Spacer(),
                          PrimaryButton(
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
                                  'Cập nhật khách hàng',
                                  style: UITextStyles.medium(14).copyWith(
                                    color: UIColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: WidgetLayout(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: UITextFieldOutline(
                                  hintText: 'Tên khách hàng',
                                  title: 'Tên khách hàng',
                                  controller: fullNameController,
                                ),
                              ),
                              const SizedBox(width: 20),
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
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: UITextFieldOutline(
                                  hintText: '0',
                                  title: 'Tổng điểm thường',
                                  controller: totalPointController,
                                  readOnly: true,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: UITextFieldOutline(
                                  hintText: '0',
                                  title: 'Tổng điểm lon',
                                  controller: totalPointLonController,
                                  readOnly: true,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: UITextFieldOutline(
                                  hintText: '0',
                                  title: 'Tổng nợ',
                                  controller: debtAmountController,
                                  readOnly: true,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: UITextFieldOutline(
                                  hintText: '0',
                                  title: 'Tổng điểm trong năm',
                                  controller: totalPointOfYearController,
                                  readOnly: true,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: Material(
                              elevation: 2,
                              color: UIColors.white,
                              shadowColor: UIColors.lightBlue,
                              borderRadius: BorderRadius.circular(8),
                              // child: ListView.separated(
                              //   itemCount: state.status.isLoading ? 5 : state.customers.length,
                              //   padding: const EdgeInsets.all(12),
                              //   separatorBuilder: (_, __) => const _Divider(),
                              //   itemBuilder: (context, index) {
                              //     return !state.status.isLoading
                              //         ? _CustomerItem(
                              //             index: index,
                              //             customer: state.customers[index],
                              //           )
                              //         : const _CustomerShimmerItem();
                              //   },
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: state.status.isLoading,
                child: const LoadingWidget.dark(isFullScreen: true),
              ),
            ],
          );
        },
      ),
    );
  }
}
