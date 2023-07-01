import 'package:commons/commons.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_home/src/ui/pages/home/components/pets_cards_widget.dart';
import 'package:micro_app_home/src/ui/pages/home/home_bloc.dart';

// final images = [
//   "https://acaochego.org/img/cachorros/1045/filhotecaixa1_13.jpg",
//   "https://static.wixstatic.com/media/deb74c_cc49d0cc7b294ae49c8e05667de63dec~mv2.png/v1/fill/w_539,h_719,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/deb74c_cc49d0cc7b294ae49c8e05667de63dec~mv2.png",
// ];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = Modular.get<HomeBloc>();
  final userProvider = UserProvider();
  @override
  void initState() {
    super.initState();
    bloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      body: Stack(
        children: [
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
            bottom: 15,
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
          ConsumerWidget(
            stream: bloc.stream,
            builder: (context, snapshot) {
              final state = snapshot.data;

              if (state is ErrorState) {}

              if (state is SuccessState<List<PetEntity>>) {
                return PetsCardsWidget(
                  pets: state.data.reversed.toList(),
                  reload: () => bloc(),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
