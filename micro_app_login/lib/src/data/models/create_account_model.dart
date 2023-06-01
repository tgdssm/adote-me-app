import 'package:micro_app_login/src/domain/entities/create_account_entity.dart';

class CreateAccountModel extends CreateAccountEntity {
  CreateAccountModel(
    super.name,
    super.email,
    super.cellphone,
    super.passwd,
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "cellphone": cellphone,
    "passwd": passwd,
  };
}
