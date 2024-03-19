import 'package:milk_points/data/models/customer_model.dart';
import 'package:milk_points/utils/data_state.dart';

abstract class CustomerRepository {
  Future<DataState<List<CustomerModel>>> getCustomers();
  Future<DataState<void>> insertCustomer(CustomerModel customer);
  Future<DataState<void>> updateCustomer(CustomerModel customer);
  Future<DataState<void>> deleteCustomer(CustomerModel customer);
}
