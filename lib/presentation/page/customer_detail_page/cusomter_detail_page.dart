import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:milk_points/data/models/customer_model.dart';
import 'package:milk_points/data/models/point_model.dart';
import 'package:milk_points/presentation/bloc/customer_bloc/customer_bloc.dart';
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
  @override
  void initState() {
    super.initState();
    context
        .read<CustomerDetailCubit>()
        .getCustomerDetail(widget.customer?.id ?? '');
    context.read<CustomerDetailCubit>().onValueChange(
          username: widget.customer?.name,
          phoneNumber: widget.customer?.phoneNumber,
          address: widget.customer?.address,
          debtAmount: widget.customer?.debtAmount.toString() ?? '0',
          totalPoint: widget.customer?.totalPoint.toString() ?? '0',
          totalPointLon: widget.customer?.totalPointLon.toString() ?? '0',
          totalPointOfYear: widget.customer?.totalPointByYear.toString() ?? '0',
        );
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
                          BackButton(
                            onPressed: () {
                              context.back();
                            },
                          ),
                          Text(
                            'Chi tiết khách hàng',
                            style: UITextStyles.regular(22).copyWith(
                              color: UIColors.brightBlue,
                            ),
                          ),
                          const Spacer(),
                          PrimaryButton(
                            onPressed: () {
                              context.read<CustomerBloc>().add(
                                    UpdateCustomerInfoEvent(
                                      customer: widget.customer!.copyWith(
                                        name: state.username,
                                        address: state.address,
                                        phoneNumber: state.phoneNumber,
                                        updateTime: DateTime.now(),
                                      ),
                                    ),
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
                                  initialValue: state.username,
                                  onChanged: (value) {
                                    context
                                        .read<CustomerDetailCubit>()
                                        .onValueChange(
                                          username: value,
                                        );
                                  },
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: UITextFieldOutline(
                                  hintText: 'Số điện thoại',
                                  title: 'Số điện thoại',
                                  initialValue: state.phoneNumber,
                                  onChanged: (value) {
                                    context
                                        .read<CustomerDetailCubit>()
                                        .onValueChange(
                                          phoneNumber: value,
                                        );
                                  },
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: UITextFieldOutline(
                                  hintText: 'Địa chỉ',
                                  title: 'Địa chỉ',
                                  initialValue: state.address,
                                  onChanged: (value) {
                                    context
                                        .read<CustomerDetailCubit>()
                                        .onValueChange(
                                          address: value,
                                        );
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: UITextFieldOutline(
                                  hintText: '0',
                                  title: 'Tổng điểm thường',
                                  initialValue: state.totalPoint,
                                  readOnly: true,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: UITextFieldOutline(
                                  hintText: '0',
                                  title: 'Tổng điểm lon',
                                  initialValue: state.totalPointLon,
                                  readOnly: true,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: UITextFieldOutline(
                                  hintText: '0',
                                  title: 'Tổng nợ',
                                  initialValue: state.debtAmount,
                                  readOnly: true,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: UITextFieldOutline(
                                  hintText: '0',
                                  title: 'Tổng điểm trong năm',
                                  initialValue: state.totalPointOfYear,
                                  readOnly: true,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 36),
                          Row(
                            children: [
                              Text(
                                'Danh sách điểm của ${widget.customer?.name}',
                                style: UITextStyles.regular(22).copyWith(
                                  color: UIColors.primaryColor,
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                child: CustomDropdown<FilterPoint>(
                                  initialItem: FilterPoint.createTime,
                                  items: FilterPoint.values,
                                  headerBuilder: (context, selectedItem) {
                                    return Text(
                                      selectedItem.description,
                                      style: UITextStyles.medium(14).copyWith(
                                          color: UIColors.primaryColor),
                                    );
                                  },
                                  listItemBuilder: (context, item, isSelected,
                                      onItemSelect) {
                                    return Text(
                                      item.description,
                                      style: UITextStyles.regular(14).copyWith(
                                        color: isSelected
                                            ? UIColors.primaryColor
                                            : null,
                                      ),
                                    );
                                  },
                                  onChanged: (value) {
                                    log('changing value to: $value');
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const _HeaderTitle(),
                          Expanded(
                            child: Material(
                              elevation: 2,
                              color: UIColors.white,
                              shadowColor: UIColors.lightBlue,
                              borderRadius: BorderRadius.circular(8),
                              child: ListView.separated(
                                itemCount: state.points.length,
                                separatorBuilder: (_, __) => const Divider(),
                                itemBuilder: (context, index) {
                                  return _ItemPoint(point: state.points[index]);
                                },
                              ),
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

class _ItemPoint extends StatelessWidget {
  const _ItemPoint({
    super.key,
    required this.point,
  });

  final PointModel point;

  @override
  Widget build(BuildContext context) {
    final Color color = switch (point.type) {
      PointType.point => UIColors.green,
      PointType.pointLon => UIColors.blue,
      PointType.debt => UIColors.red,
    };
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: UIColors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width < 820 ? 100 : 200,
            child: Text(
              DateFormat('dd/MM/yyyy HH:mm:ss').format(point.createTime),
              style: UITextStyles.regular(18),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.sizeOf(context).width < 820 ? 100 : 200,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: color.withOpacity(0.2),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    point.type.description,
                    style: UITextStyles.regular(16).copyWith(
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width < 820 ? 80 : 150,
            child: Text(
              point.value.toString(),
              style: UITextStyles.regular(18),
            ),
          ),
          Expanded(
            child: Text(
              point.comment,
              style: UITextStyles.regular(18),
            ),
          ),
          SizedBox(
            width: 60,
            child: InkWell(
              onTap: () {
                context.read<CustomerDetailCubit>().deletePoint(point);
              },
              child: const AppImage.asset(
                asset: 'ic_delete',
                height: 24,
                width: 24,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  const _HeaderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: UIColors.lightGray,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width < 820 ? 100 : 200,
            child: Text(
              'Ngày tạo',
              style: UITextStyles.regular(18),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.sizeOf(context).width < 820 ? 100 : 200,
            child: Text(
              'Loại',
              style: UITextStyles.regular(18),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width < 820 ? 80 : 150,
            child: Text(
              'Giá trị',
              style: UITextStyles.regular(18),
            ),
          ),
          Expanded(
            child: Text(
              'Nội dung',
              style: UITextStyles.regular(18),
            ),
          ),
          PrimaryButton(
            onPressed: () {},
            buttonColor: UIColors.green,
            widget: Row(
              children: [
                const AppImage.asset(
                  asset: 'ic_add_outline',
                  color: UIColors.white,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 6),
                Text(
                  'Thêm điểm',
                  style: UITextStyles.medium(14).copyWith(
                    color: UIColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
