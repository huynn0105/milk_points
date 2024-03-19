import 'package:bloc/bloc.dart';
import 'package:milk_points/data/models/customer_model.dart';
import 'package:milk_points/di/locator.dart';
import 'package:milk_points/domain/repository/customer_repository.dart';
import 'package:milk_points/utils/bloc_status.dart';
import 'package:milk_points/utils/data_state.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final _customerRepository = locator<CustomerRepository>();
  CustomerBloc() : super(CustomerState()) {
    on<CustomerGetDataEvent>(
      (event, emit) async {
        emit(state.copyWith(status: BlocStatus.loading));
        final result = await _customerRepository.getCustomers();
        if (result is DataSuccess) {
          result.data!.sort((a, b) => a.updateTime.compareTo(b.updateTime));
          emit(
            state.copyWith(
              customers: result.data!,
              status: BlocStatus.success,
            ),
          );
        } else {
          emit(
            state.copyWith(
              messageError: result.errorMessage,
              status: BlocStatus.failure,
            ),
          );
        }
      },
    );

    on<AddNewCustomerEvent>((event, emit) async {
      emit(state.copyWith(status: BlocStatus.loading));
      final result = await _customerRepository.insertCustomer(event.customer);
      if (result is DataSuccess) {
        emit(state.copyWith(
          status: BlocStatus.success,
          customers: [event.customer, ...state.customers],
        ));
      } else {
        emit(state.copyWith(
          status: BlocStatus.failure,
          messageError: result.errorMessage,
        ));
      }
    });

    on<UpdateCustomerInfoEvent>((event, emit) async {
      emit(state.copyWith(status: BlocStatus.loading));
      final result = await _customerRepository.updateCustomer(event.customer);
      if (result is DataSuccess) {
        final customers = List<CustomerModel>.from(state.customers)..removeWhere((x) => x.id == event.customer.id);
        emit(state.copyWith(
          status: BlocStatus.success,
          customers: [event.customer, ...customers],
        ));
      } else {
        emit(state.copyWith(
          status: BlocStatus.failure,
          messageError: result.errorMessage,
        ));
      }
    });

    on<DeleteCustomerEvent>((event, emit) async {
      emit(state.copyWith(status: BlocStatus.loading));
      final result = await _customerRepository.deleteCustomer(event.customer);
      if (result is DataSuccess) {
        final customers = List<CustomerModel>.from(state.customers)..remove(event.customer);
        emit(state.copyWith(
          status: BlocStatus.success,
          customers: customers,
        ));
      } else {
        emit(state.copyWith(
          status: BlocStatus.failure,
          messageError: result.errorMessage,
        ));
      }
    });

    on<FilterCustomerEvent>((event, emit) {
      final customers = List<CustomerModel>.from(state.customers);
      switch (event.filter) {
        case FilterCustomer.point:
          customers.sort((a, b) => a.totalPoint.compareTo(b.totalPoint));
          break;
        case FilterCustomer.pointLon:
          customers.sort((a, b) => a.totalPointLon.compareTo(b.totalPointLon));
          break;
        case FilterCustomer.dept:
          customers.sort((a, b) => a.debtAmount.compareTo(b.debtAmount));
          break;
        case FilterCustomer.updateTime:
          customers.sort((a, b) => a.updateTime.compareTo(b.updateTime));
          break;
        case FilterCustomer.pointByYear:
          customers.sort((a, b) => a.totalPointByYear.compareTo(b.totalPointByYear));
          break;
      }
    });
  }
}
