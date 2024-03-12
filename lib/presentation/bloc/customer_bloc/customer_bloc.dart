import 'package:bloc/bloc.dart';
import 'package:milk_points/data/models/customer_model.dart';
import 'package:milk_points/di/locator.dart';
import 'package:milk_points/domain/repository/customer_repository.dart';
import 'package:milk_points/utils/bloc_status.dart';
import 'package:milk_points/utils/data_state.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  //final _customerRepository = locator<CustomerRepository>();
  CustomerBloc() : super(CustomerState()) {
    on<CustomerGetDataEvent>(
      (event, emit) async {
        emit(state.copyWith(status: BlocStatus.loading));
        // final result = await _customerRepository.getCustomers();
        // if (result is DataSuccess) {
        //   emit(
        //     state.copyWith(
        //       customers: result.data!,
        //       status: BlocStatus.success,
        //     ),
        //   );
        // } else {
        //   emit(
        //     state.copyWith(
        //       message: result.errorMessage,
        //       status: BlocStatus.failure,
        //     ),
        //   );
        // }
      },
    );
  }
}
