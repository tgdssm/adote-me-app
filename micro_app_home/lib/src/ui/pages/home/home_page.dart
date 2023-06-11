import 'package:commons/commons.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_home/src/ui/pages/home/home_bloc.dart';

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
    print(userProvider.hasUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConsumerWidget(
        stream: bloc.stream,
        builder: (context, snapshot) {
          final state = snapshot.data;

          if (state is ErrorState) {}

          if (state is SuccessState<List<PetEntity>>) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) => Image.network(state.data[index].photos.first),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
