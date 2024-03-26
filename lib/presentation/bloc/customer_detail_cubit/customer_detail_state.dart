part of 'customer_detail_cubit.dart';

class CustomerDetailState {
  final BlocStatus status;
  final List<PointModel> points;
  final String? errorMessage;
  final String username;
  final String phoneNumber;
  final String address;
  final String totalPoint;
  final String totalPointLon;
  final String debtAmount;
  final String totalPointOfYear;

  const CustomerDetailState({
    this.status = BlocStatus.initial,
    this.points = const [],
    this.errorMessage,
    this.username = '',
    this.phoneNumber = '',
    this.address = '',
    this.totalPoint = '',
    this.totalPointLon = '',
    this.debtAmount = '',
    this.totalPointOfYear = '',
  });

  CustomerDetailState copyWith({
    BlocStatus? status,
    List<PointModel>? points,
    String? errorMessage,
    String? username,
    String? phoneNumber,
    String? address,
    String? totalPoint,
    String? totalPointLon,
    String? debtAmount,
    String? totalPointOfYear,
  }) {
    return CustomerDetailState(
      status: status ?? this.status,
      points: points ?? this.points,
      errorMessage: errorMessage ?? this.errorMessage,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      totalPoint: totalPoint ?? this.totalPoint,
      totalPointLon: totalPointLon ?? this.totalPointLon,
      debtAmount: debtAmount ?? this.debtAmount,
      totalPointOfYear: totalPointOfYear ?? this.totalPointOfYear,
    );
  }
}

enum FilterPoint {
  createTime('Thời gian vừa tạo'),
  point('Điểm thường'),
  pointLon('Điểm lon'),
  debt('Nợ');

  final String description;
  const FilterPoint(this.description);
}
