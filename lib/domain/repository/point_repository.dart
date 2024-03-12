import 'package:milk_points/data/models/point_model.dart';
import 'package:milk_points/utils/data_state.dart';

abstract class PointRepository {
  Future<DataState<List<PointModel>>> getPointsByCustomerId(String customerId);
  Future<void> insertPoint(PointModel point);
  Future<void> updatePoint(PointModel point);
  Future<void> deletePoint(PointModel point);
}
