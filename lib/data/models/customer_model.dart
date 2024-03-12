class CustomerModel {
  final String id;
  final DateTime createTime;
  final String name;
  final String? phoneNumber;
  final String? address;
  final int totalPoint;
  final int totalPointLon;
  final int debtAmount;
  final int totalPointByYear;
  final DateTime updateTime;

  CustomerModel({
    required this.name,
    this.phoneNumber,
    this.address,
    required this.totalPoint,
    required this.totalPointLon,
    required this.debtAmount,
    required this.totalPointByYear,
    required this.id,
    required this.createTime,
    required this.updateTime,
  });

  CustomerModel copyWith({
    String? name,
    String? phoneNumber,
    String? address,
    int? totalPoint,
    int? totalPointLon,
    int? debtAmount,
    int? totalPointByYear,
    DateTime? updateTime,
  }) {
    return CustomerModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      totalPoint: totalPoint ?? this.totalPoint,
      totalPointLon: totalPointLon ?? this.totalPointLon,
      debtAmount: debtAmount ?? this.debtAmount,
      totalPointByYear: totalPointByYear ?? this.totalPointByYear,
      createTime: createTime,
      id: id,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'totalPoint': totalPoint,
      'totalPointLon': totalPointLon,
      'debtAmount': debtAmount,
      'totalPointByYear': totalPointByYear,
      'id': id,
      'createTime': createTime.toIso8601String(),
      'updateTime': updateTime.toIso8601String(),
    };
  }

  factory CustomerModel.fromJson(Map<String, dynamic> map) {
    return CustomerModel(
      name: map['name'] as String,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      totalPoint: map['totalPoint'] as int,
      totalPointLon: map['totalPointLon'] as int,
      debtAmount: map['debtAmount'] as int,
      totalPointByYear: map['totalPointByYear'] as int,
      id: map['comment'] as String,
      createTime: DateTime.parse(map['createTime'] as String),
      updateTime: DateTime.parse(map['updateTime'] as String),
    );
  }
}
