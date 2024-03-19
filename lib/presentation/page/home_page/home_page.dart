import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_points/data/models/customer_model.dart';
import 'package:milk_points/presentation/bloc/customer_bloc/customer_bloc.dart';
import 'package:milk_points/presentation/common/buttons.dart';
import 'package:milk_points/presentation/common/colors.dart';
import 'package:milk_points/presentation/common/dialog.dart';
import 'package:milk_points/presentation/common/images.dart';
import 'package:milk_points/presentation/common/loading.dart';
import 'package:milk_points/presentation/common/textstyle.dart';
import 'package:milk_points/utils/bloc_status.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uuid/uuid.dart';

import '../../common/widget_layout.dart';
import '../../common/textfield.dart';
import '../../common/checkbox.dart';

part './widgets/button.dart';
part './widgets/customer_item.dart';
part './widgets/divider.dart';
part './widgets/info.dart';
part './widgets/item_row.dart';
part './widgets/add_customer_button.dart';
part './widgets/filter_button.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomerBloc()..add(CustomerGetDataEvent()),
      child: this,
    );
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.lightBlue,
      body: BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  const WidgetLayout(
                    color: UIColors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: UISearchTextField(
                              hintText: 'Tìm kiếm',
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
                          SizedBox(width: 20),
                          _AddCustomerButton(),
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
                              Text(
                                'Danh sách khách hàng',
                                style: UITextStyles.regular(22).copyWith(
                                  color: UIColors.brightBlue,
                                ),
                              ),
                              const Spacer(),
                              const _FilterButton()
                            ],
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: Material(
                              elevation: 2,
                              color: UIColors.white,
                              shadowColor: UIColors.lightBlue,
                              borderRadius: BorderRadius.circular(8),
                              child: ListView.separated(
                                itemCount: state.status.isLoading ? 5 : state.customers.length,
                                padding: const EdgeInsets.all(12),
                                separatorBuilder: (_, __) => const _Divider(),
                                itemBuilder: (context, index) {
                                  return !state.status.isLoading
                                      ? _CustomerItem(
                                          index: index,
                                          customer: state.customers[index],
                                        )
                                      : const _CustomerShimmerItem();
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
