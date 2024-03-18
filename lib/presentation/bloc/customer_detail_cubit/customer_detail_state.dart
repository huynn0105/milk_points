part of 'customer_detail_cubit.dart';

class CustomerDetailState {
  final BlocStatus status;
  final List<PointModel> points;
  final String? messageError;

  const CustomerDetailState({
    this.status = BlocStatus.initial,
    this.points = const [],
    this.messageError,
  });

  CustomerDetailState copyWith({
    BlocStatus? status,
    List<PointModel>? points,
    String? messageError,
  }) {
    return CustomerDetailState(
      status: status ?? this.status,
      points: points ?? this.points,
      messageError: messageError ?? this.messageError,
    );
  }
}
