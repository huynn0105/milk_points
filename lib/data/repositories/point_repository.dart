import 'package:milk_points/data/models/point_model.dart';
import 'package:milk_points/data/repositories/base/api_base_repository.dart';
import 'package:milk_points/domain/repository/point_repository.dart';
import 'package:milk_points/utils/data_state.dart';
import 'package:milk_points/utils/firebase_convert.dart';

import '../datasources/firebase/customer_firebase_api_service.dart';

class PointRepositoryImpl extends BaseApiRepository implements PointRepository {
  // final CustomerFirebaseService _customerFirebaseService =
  //     CustomerFirebaseService.instance;

  @override
  Future<DataState<List<PointModel>>> getPointsByCustomerId(String customerId) {
    return getStateOfFirebase<List<PointModel>>(request: () async {
      // final snapshot =
      //     await _customerFirebaseService.pointCollection(customerId).get();
      // final result = snapshot.docs
      //     .map((e) =>
      //         PointModel.fromJson(FirebaseUtil.convertObjectToMap(e.data())))
      //     .toList();
      return [
        PointModel(
          id: '',
          comment: 'Mua sữa',
          createTime: DateTime.now(),
          customerId: '',
          type: PointType.point,
          value: 22,
        ),
        PointModel(
          id: '',
          comment: 'Nợ',
          createTime: DateTime.now(),
          customerId: '',
          type: PointType.debt,
          value: 10000,
        ),
        PointModel(
          id: '',
          comment:
              'Mua sữa lon Mua sữa lon Mua sữa lon Mua sữa lon Mua sữa lon Mua sữa lon Mua sữa lon',
          createTime: DateTime.now(),
          customerId: '',
          type: PointType.pointLon,
          value: 22,
        ),
      ];
    });
  }

  @override
  Future<DataState<void>> insertPoint(PointModel point) {
    return getStateOfFirebase<void>(
      request: () async {
        // return _customerFirebaseService
        //     .pointRef(point.customerId, point.id)
        //     .set(point.toJson());
      },
    );
  }

  @override
  Future<DataState<void>> updatePoint(PointModel point) {
    return getStateOfFirebase<void>(
      request: () async {
        // return _customerFirebaseService
        //     .pointRef(point.customerId, point.id)
        //     .update(point.toJson());
      },
    );
  }

  @override
  Future<DataState<void>> deletePoint(PointModel point) {
    return getStateOfFirebase<void>(
      request: () async {
        // return _customerFirebaseService
        //     .pointRef(point.customerId, point.id)
        //     .delete();
      },
    );
  }
}
