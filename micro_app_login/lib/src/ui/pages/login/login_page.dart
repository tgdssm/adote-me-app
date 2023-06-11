import 'package:commons/commons.dart';
import 'package:core/navigation/routes.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bloc = Modular.get<LoginBloc>();
  final userProvider = UserProvider();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                print(userProvider.hasUser);
                Modular.to.pushReplacementNamed(Routes.home.path);
              }
              if(state is ErrorState) {
              }
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      Strings.login.toUpperCase(),
                      style: TextStyles.heading1,
                    ),
                    const SizedBox(height: 20),
                    DefaultTextField(
                      controller: emailController,
                      label: Strings.email,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          Strings.dontHaveAccountYet,
                          style: TextStyles.subtitle1,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: (){
                            Modular.to.pushReplacementNamed(Routes.initial.path);
                          },
                          child: const Text(
                            Strings.signup,
                            style: TextStyles.subtitle1,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    DefaultButton(
                      onPressed: () {
                        bloc(emailController.text, passwordController.text);
                      },
                      width: MediaQuery.sizeOf(context).width,
                      title: Strings.login.toUpperCase(),
                      loading: state is LoadingState,
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              );
            },
          ),
        ).addPadding(),
      ),
    );
  }
}
