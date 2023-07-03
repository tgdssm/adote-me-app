
class UserEntity {
  final int id;
  final String name;
  final String email;
  final String cellphone;
  final DateTime createdAt;
  final String? token;

  UserEntity(
    this.id,
    this.name,
    this.email,
    this.cellphone,
    this.createdAt,
    this.token,
  );
}
