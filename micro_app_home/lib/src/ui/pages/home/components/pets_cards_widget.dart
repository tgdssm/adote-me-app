import 'package:commons/commons.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class PetsCardsWidget extends StatefulWidget {
  final List<PetEntity> pets;
  final VoidCallback reload;
  const PetsCardsWidget({Key? key, required this.pets, required this.reload})
      : super(key: key);

  @override
  State<PetsCardsWidget> createState() => _PetsCardsWidgetState();
}

class _PetsCardsWidgetState extends State<PetsCardsWidget> {
  final updateBloc = UpdateBloc<List<PetEntity>>();
  @override
  void initState() {
    updateBloc(widget.pets);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConsumerWidget<List<PetEntity>>(
      stream: updateBloc.stream,
      builder: (context, snapshot) {
        final state = snapshot.data;
        if (state is List<PetEntity>) {
          return Stack(
            children: [
              Center(
                child: MaterialButton(
                  onPressed: widget.reload,
                  child: const Text("Recarregar"),
                ),
              ),
              ...state
                  .map(
                    (e) => Center(
                      child: SwiperCard(
                        urlImage: e.photos.first,
                        petName: e.name,
                        nextCard: () {
                          widget.pets.removeLast();
                          updateBloc(widget.pets);
                        },
                      ),
                    ),
                  )
                  .toList(),
              ...state
                  .map((e) => Positioned(
                        top: MediaQuery.sizeOf(context).height / 2 + 230,
                        child: Visibility(
                          visible: widget.pets.indexOf(e) ==
                              (widget.pets.length - 1),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.grey1,
                                  ),
                                ),
                                const SizedBox(width: 15,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.user.name,
                                      style: TextStyles.subtitle1,
                                    ),
                                    Text(
                                      publicationDate(e.createdAt),
                                      style: TextStyles.labelField,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ],
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  String publicationDate(DateTime createAt) {
    final differenceInDays = DateTime.now().difference(createAt).inDays;
    if(differenceInDays == 0) {
      return "postado hoje";
    } else {
      if(differenceInDays > 1) {
        return "há $differenceInDays dias";
      } else {
        return "há 1 dia";
      }
    }
  }
}
