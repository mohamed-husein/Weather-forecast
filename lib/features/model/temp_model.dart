import 'package:equatable/equatable.dart';

class Temp extends Equatable {
  final double min;
  final double max;

  const Temp({required this.min, required this.max});

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(min: json['min'].toDouble(), max: json['max'].toDouble());
  }
  
  @override
  List<Object?> get props => [min,max];
}
