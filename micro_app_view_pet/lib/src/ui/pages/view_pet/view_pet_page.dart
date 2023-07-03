import 'package:commons/commons.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_view_pet/src/ui/pages/view_pet/components/pet_photos_widget.dart';

class ViewPetPage extends StatelessWidget {
  final PetEntity pet;
  const ViewPetPage({Key? key, required this.pet}) : super(key: key);

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
                      Strings.details,
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 400,
                      child: PetPhotosWidget(
                        pet: pet,
                        reload: () {},
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  formatAge(pet.age),
                                  style: TextStyles.subtitleBlack1,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  formatWeight(pet.weight),
                                  style: TextStyles.subtitleBlack1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            pet.requirements,
                            style: TextStyles.subtitleBlack1,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DefaultButton(
                          onPressed: () async {
                            await launchUrl(
                              Uri.parse(
                                'mailto:${pet.user.email}?subject=Gostaria de saber mais sobre o pet ${pet.name}.&body=Olá ${pet.user.name}, vi seu post no Adote.me app e gostaria de saber mais sobre o pet.',
                              ),
                            );
                          },
                          width: MediaQuery.sizeOf(context).width,
                          title: Strings.sendEmail,
                        ),
                      ],
                    ).addPadding()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatAge(int age) {
    if (age == 0) {
      return 'Alguns meses';
    } else if (age == 1) {
      return '$age Ano';
    }
    return '$age Anos';
  }

  String formatWeight(double weight) {
    if (weight.toString().split('.').last == '0') {
      return '${weight.toStringAsFixed(0)} Kg';
    }
    return '${weight.toStringAsFixed(2)} Kg';
  }
}
