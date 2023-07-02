import 'dart:io';

import 'package:commons/commons.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_register_pet/src/domain/entities/pet_data_entity.dart';
import 'package:micro_app_register_pet/src/ui/pages/register/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userProvider = UserProvider();
  final bloc = Modular.get<RegisterBloc>();
  final updateImagesBloc = UpdateBloc<bool>();
  final picker = ImagePicker();
  final name = TextEditingController();
  final age = TextEditingController();
  final weight = TextEditingController();
  final requirements = TextEditingController();
  final photos = <File>[];

  Future<void> getPhotos() async {
    final photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      photos.add(File(photo.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 80,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          Modular.to.pop();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      Strings.registerPet,
                      style: TextStyles.heading1.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: -125,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            right: -125,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondary,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(top: 120),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.whiteBackground,
              ),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      ConsumerWidget<bool>(
                        stream: updateImagesBloc.stream,
                        builder: (context, snapshot) {
                          final state = snapshot.data;
                          return Visibility(
                            visible: photos.isEmpty,
                            replacement: Row(
                              children: [
                                ...photos.map(
                                  (e) => Container(
                                    height: 80,
                                    width: 80,
                                    margin: const EdgeInsets.only(right: 5),
                                    child: Image.file(e),
                                  ),
                                ),
                                if (photos.length < 3)
                                  IconButton(
                                    onPressed: () async {
                                      await getPhotos();
                                      updateImagesBloc(!state!);
                                    },
                                    icon: const Icon(
                                      Icons.add_a_photo,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                              ],
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await getPhotos();
                                    updateImagesBloc(true);
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.add_a_photo,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  Strings.addPhotos,
                                  style: TextStyles.labelField,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultTextField(
                        controller: name,
                        label: Strings.name,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 20),
                      DefaultTextField(
                        controller: age,
                        label: Strings.age,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 20),
                      DefaultTextField(
                        controller: weight,
                        label: Strings.weight,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 20),
                      DefaultTextField(
                        controller: requirements,
                        label: Strings.requirements,
                        validator: (value) {},
                      ),
                      const SizedBox(height: 40),
                      ConsumerWidget<BaseState>(
                        stream: bloc.stream,
                        builder: (context, snapshot) {
                          final state = snapshot.data;
                          if(state is SuccessState) {
                            Modular.to.pushReplacementNamed(Routes.home.path);
                          }
                          return DefaultButton(
                            onPressed: () async {
                              final petData = PetDataEntity(
                                name.text,
                                int.parse(age.text),
                                double.parse(weight.text),
                                userProvider.userData.id,
                                requirements.text,
                                photos,
                              );
                              await bloc(petData);
                            },
                            width: MediaQuery.sizeOf(context).width,
                            title: Strings.register,
                            loading: state is LoadingState,
                          );
                        },
                      ),
                    ],
                  ),
                ).addPadding(horizontal: 20),
              ),
            ).addPadding(),
          ),
        ],
      ),
    );
  }
}
