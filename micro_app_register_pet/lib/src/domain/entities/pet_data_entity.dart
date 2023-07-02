import 'dart:io';

class PetDataEntity {
  final String name;
  final int age;
  final double weight;
  final int userId;
  final String requirements;
  final List<File> photos;

  PetDataEntity(
    this.name,
    this.age,
    this.weight,
    this.userId,
    this.requirements,
    this.photos,
  );
}
