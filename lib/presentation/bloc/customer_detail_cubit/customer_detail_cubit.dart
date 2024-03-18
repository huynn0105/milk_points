import 'package:bloc/bloc.dart';
import 'package:milk_points/data/models/point_model.dart';
import 'package:milk_points/di/locator.dart';
import 'package:milk_points/domain/repository/point_repository.dart';
import 'package:milk_points/utils/bloc_status.dart';
import 'package:milk_points/utils/data_state.dart';

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
        messageError: result.errorMessage,
      ));
    }
  }
}
