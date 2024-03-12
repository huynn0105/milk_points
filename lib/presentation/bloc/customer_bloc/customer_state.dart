// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'customer_bloc.dart';

class CustomerState {
  final BlocStatus status;
  final List<CustomerModel> customers;
  final String? message;

  CustomerState({
    this.status = BlocStatus.initial,
    this.customers = const [],
    this.message,
  });

  CustomerState copyWith({
    BlocStatus? status,
    List<CustomerModel>? customers,
    String? message,
  }) {
    return CustomerState(
      status: status ?? this.status,
      customers: customers ?? this.customers,
      message: message ?? this.message,
    );
  }
}
