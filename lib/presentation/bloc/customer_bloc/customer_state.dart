// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'customer_bloc.dart';

class CustomerState {
  final BlocStatus status;
  final FilterCustomer filter;
  final List<CustomerModel> customers;
  final String? messageError;

  CustomerState({
    this.status = BlocStatus.initial,
    this.customers = const [],
    this.messageError,
    this.filter = FilterCustomer.updateTime,
  });

  CustomerState copyWith({
    BlocStatus? status,
    List<CustomerModel>? customers,
    String? messageError,
  }) {
    return CustomerState(
      status: status ?? this.status,
      customers: customers ?? this.customers,
      messageError: messageError ?? this.messageError,
    );
  }
}

enum FilterCustomer {
  point('Top điểm thường'),
  pointLon('Top điểm lon'),
  dept('Top nợ'),
  updateTime('Vừa mới cập nhật'),
  pointByYear('Mua nhiều nhất trong năm');

  final String description;
  const FilterCustomer(this.description);
}
