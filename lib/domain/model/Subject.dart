import 'package:equatable/equatable.dart';

class Subject extends Equatable {
  final String? id;
  final String? name;
  final String? icon;
  final String? createdAt;

  const Subject({
     this.id,
     this.name,
     this.icon,
     this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, icon, createdAt];
}
