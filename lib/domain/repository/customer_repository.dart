import 'package:milk_points/data/models/customer_model.dart';
import 'package:milk_points/utils/data_state.dart';

abstract class CustomerRepository {
  Future<DataState<List<CustomerModel>>> getCustomers();
  Future<void> insertCustomer(CustomerModel customer);
  Future<void> updateCustomer(CustomerModel customer);
  Future<void> deleteCustomer(CustomerModel customer);
}
