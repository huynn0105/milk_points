import 'package:milk_points/data/models/customer_model.dart';
import 'package:milk_points/data/repositories/base/api_base_repository.dart';
import 'package:milk_points/domain/repository/customer_repository.dart';
import 'package:milk_points/utils/data_state.dart';
import 'package:milk_points/utils/firebase_convert.dart';
import 'package:uuid/uuid.dart';

import '../datasources/firebase/customer_firebase_api_service.dart';

class CustomerRepositoryImpl extends BaseApiRepository implements CustomerRepository {
  //final CustomerFirebaseService _customerFirebaseService = CustomerFirebaseService.instance;

  @override
  Future<DataState<List<CustomerModel>>> getCustomers() {
    return getStateOfFirebase<List<CustomerModel>>(
      request: () async {
        // final snapshot =
        //     await _customerFirebaseService.customerCollection.get();
        // final result = snapshot.docs
        //     .map((e) => CustomerModel.fromJson(
        //         FirebaseUtil.convertObjectToMap(e.data())))
        //     .toList();
        final result = [
          CustomerModel(
            name: 'Nguyễn Nhật Huy',
            totalPoint: 12,
            totalPointLon: 22,
            debtAmount: 30000,
            totalPointByYear: 22,
            id: const Uuid().v4(),
            createTime: DateTime.now(),
            updateTime: DateTime.now(),
          )
        ];
        return result;
      },
    );
  }

  @override
  Future<DataState<void>> insertCustomer(CustomerModel customer) {
    return getStateOfFirebase<void>(
      request: () async {
        //return _customerFirebaseService.customerRef(customer.id).set(customer.toJson());
      },
    );
  }

  @override
  Future<DataState<void>> updateCustomer(CustomerModel customer) {
    return getStateOfFirebase<void>(
      request: () async {
        // return _customerFirebaseService.customerRef(customer.id).update(
        //       customer.copyWith(updateTime: DateTime.now()).toJson(),
        //     );
      },
    );
  }

  @override
  Future<DataState<void>> deleteCustomer(CustomerModel customer) {
    return getStateOfFirebase<void>(
      request: () async {
        //return _customerFirebaseService.customerRef(customer.id).delete();
      },
    );
  }
}
