import 'package:bloc/bloc.dart';
import 'package:milk_points/data/models/point_model.dart';
import 'package:milk_points/di/locator.dart';
import 'package:milk_points/domain/repository/point_repository.dart';
import 'package:milk_points/utils/bloc_status.dart';
import 'package:milk_points/utils/data_state.dart';
import 'package:uuid/uuid.dart';

part 'customer_detail_state.dart';

class CustomerDetailCubit extends Cubit<CustomerDetailState> {
  CustomerDetailCubit() : super(const CustomerDetailState());

  final _pointRepository = locator<PointRepository>();

  void getCustomerDetail(String customerId) async {
    emit(state.copyWith(status: BlocStatus.loading));
    final result = await _pointRepository.getPointsByCustomerId(customerId);
    if (result is DataSuccess) {
      emit(state.copyWith(
        status: BlocStatus.success,
        points: result.data,
      ));
    } else {
      emit(state.copyWith(
        status: BlocStatus.failure,
        errorMessage: result.errorMessage,
      ));
    }
  }

  void deletePoint(PointModel point) async {
    emit(state.copyWith(status: BlocStatus.loading));

    final result = await _pointRepository.deletePoint(point);
    if (result is DataSuccess) {
      final points = List<PointModel>.from(state.points)..remove(point);
      emit(state.copyWith(
        status: BlocStatus.success,
        points: points,
      ));
    } else {
      emit(state.copyWith(
        status: BlocStatus.failure,
        errorMessage: result.errorMessage,
      ));
    }
  }

  void addNewPoint(
    String customerId, {
    int pointNormal = 0,
    int pointLon = 0,
    int debt = 0,
    String comment = '',
  }) async {
    List<PointModel> points = [];
    emit(state.copyWith(status: BlocStatus.loading));
    if (pointNormal > 0) {
      points.add(
        PointModel(
          id: const Uuid().v4(),
          createTime: DateTime.now(),
          customerId: customerId,
          value: pointNormal,
          comment: comment,
          type: PointType.point,
        ),
      );
    }
    if (pointLon > 0) {
      points.add(
        PointModel(
          id: const Uuid().v4(),
          createTime: DateTime.now(),
          customerId: customerId,
          value: pointLon,
          comment: comment,
          type: PointType.pointLon,
        ),
      );
    }
    if (debt > 0) {
      points.add(
        PointModel(
          id: const Uuid().v4(),
          createTime: DateTime.now(),
          customerId: customerId,
          value: debt,
          comment: comment,
          type: PointType.debt,
        ),
      );
    }
    final result = await Future.wait<DataState<void>>(
        points.map((point) => _pointRepository.insertPoint(point)));
    if (result.every((e) => e is DataSuccess)) {
      emit(state.copyWith(
          status: BlocStatus.success, points: [...points, ...state.points]));
    } else {
      final messageError =
          result.whereType<DataFailed>().map((e) => e.errorMessage).join("\n");
      emit(state.copyWith(
        status: BlocStatus.failure,
        errorMessage: messageError,
      ));
    }
  }

  onValueChange({
    String? username,
    String? phoneNumber,
    String? address,
    String? totalPoint,
    String? totalPointLon,
    String? debtAmount,
    String? totalPointOfYear,
  }) {
    emit(state.copyWith(
      username: username,
      phoneNumber: phoneNumber,
      address: address,
      debtAmount: debtAmount,
      totalPoint: totalPoint,
      totalPointLon: totalPointLon,
      totalPointOfYear: totalPointOfYear,
    ));
  }
}
