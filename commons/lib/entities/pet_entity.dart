import 'package:commons/commons.dart';

class PetEntity {
  final int id;
  final String name;
  final int age;
  final double weight;
  final String requirements;
  final DateTime createdAt;
  final UserEntity user;
  final List<String> photos;

  PetEntity(
    this.id,
    this.name,
    this.age,
    this.weight,
    this.requirements,
    this.createdAt,
    this.user,
    this.photos,
  );
}
