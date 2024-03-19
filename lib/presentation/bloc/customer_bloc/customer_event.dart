part of 'customer_bloc.dart';

sealed class CustomerEvent {}

class CustomerGetDataEvent extends CustomerEvent {}

class AddNewCustomerEvent extends CustomerEvent {
  final CustomerModel customer;

  AddNewCustomerEvent({required this.customer});
}

class UpdateCustomerInfoEvent extends CustomerEvent {
  final CustomerModel customer;

  UpdateCustomerInfoEvent({
    required this.customer,
  });
}

class DeleteCustomerEvent extends CustomerEvent {
  final CustomerModel customer;

  DeleteCustomerEvent({required this.customer});
}

class FilterCustomerEvent extends CustomerEvent {
  final FilterCustomer filter;
  FilterCustomerEvent({
    required this.filter,
  });
}
