
class PointModel {
  final String customerId;
  final int value;
  final String comment;
  final PointType type;
  final String id;
  final DateTime createTime;

  PointModel({
    required this.id,
    required this.createTime,
    required this.customerId,
    required this.value,
    required this.comment,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'customerId': customerId,
      'value': value,
      'comment': comment,
      'type': type.index,
      'id': id,
      'createTime': createTime.toIso8601String(),
    };
  }

  factory PointModel.fromJson(Map<String, dynamic> map) {
    return PointModel(
      customerId: map['customerId'] as String,
      value: map['value'] as int,
      comment: map['comment'] as String,
      type: PointType.values.singleWhere(
        (x) => x.index == (map['type'] as int),
      ),
      id: map['comment'] as String,
      createTime: DateTime.parse(map['createTime'] as String),
    );
  }
}

enum PointType {
  point,
  pointLon,
  debt;
}
