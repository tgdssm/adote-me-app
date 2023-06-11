import 'package:commons/commons.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_login/src/domain/entities/create_account_entity.dart';
import 'package:micro_app_login/src/ui/pages/create_account/create_account_bloc.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final bloc = Modular.get<CreateAccountBloc>();
  final userProvider = UserProvider();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cellphoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: SizedBox(
          child: ConsumerWidget<BaseState>(
            stream: bloc.stream,
            builder: (context, snapshot) {
              final state = snapshot.data;
              if(state is SuccessState<UserEntity>) {
                userProvider.userData = state.data;
              }
              if(state is ErrorState) {

              }
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        Strings.createAccount,
                        style: TextStyles.heading1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            Strings.alreadyRegistered,
                            style: TextStyles.subtitle1,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          InkWell(
                            onTap: (){
                              Modular.to.pushReplacementNamed(Routes.login.path);
                            },
                            child: const Text(
                              Strings.login,
                              style: TextStyles.subtitle1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      DefaultTextField(
                        controller: nameController,
                        label: Strings.name,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 20),
                      DefaultTextField(
                        controller: emailController,
                        label: Strings.email,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 20),
                      DefaultTextField(
                        controller: cellphoneController,
                        label: Strings.cellphone,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 20),
                      DefaultTextField(
                        controller: passwordController,
                        label: Strings.password,
                        obscure: true,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 20),
                      DefaultTextField(
                        controller: confirmPasswordController,
                        obscure: true,
                        label: Strings.confirmPassword,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 60),
                      DefaultButton(
                        onPressed: () {
                          final entity = CreateAccountEntity(nameController.text, emailController.text, cellphoneController.text, passwordController.text);
                          bloc(entity);
                        },
                        width: MediaQuery.sizeOf(context).width,
                        title: Strings.register,
                        loading: state is LoadingState,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ).addPadding(),
      ),
    );
  }
}
