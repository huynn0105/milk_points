import 'package:milk_points/data/models/point_model.dart';
import 'package:milk_points/utils/data_state.dart';

abstract class PointRepository {
  Future<DataState<List<PointModel>>> getPointsByCustomerId(String customerId);
  Future<DataState<void>> insertPoint(PointModel point);
  Future<DataState<void>> updatePoint(PointModel point);
  Future<DataState<void>> deletePoint(PointModel point);
}
