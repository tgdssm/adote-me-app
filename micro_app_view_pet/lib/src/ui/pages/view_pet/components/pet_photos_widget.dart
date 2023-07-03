import 'package:commons/commons.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class PetPhotosWidget extends StatefulWidget {
  final PetEntity pet;
  final VoidCallback reload;
  const PetPhotosWidget({Key? key, required this.pet, required this.reload})
      : super(key: key);

  @override
  State<PetPhotosWidget> createState() => _PetPhotosWidgetState();
}

class _PetPhotosWidgetState extends State<PetPhotosWidget> {
  final updateBloc = UpdateBloc<bool>();
  final photos = <String>[];
  @override
  void initState() {
    photos.addAll(widget.pet.photos);
    updateBloc(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConsumerWidget<bool>(
      stream: updateBloc.stream,
      builder: (context, snapshot) {
        return Stack(
          children: [
            Center(
              child: DefaultButton(
                onPressed: () {
                  photos.addAll(widget.pet.photos);
                  updateBloc(true);
                },
                title: 'Recarregar',
                width: 150,
              ),
            ),
            ...photos.map(
                  (e) => Center(
                child: SwiperCard(
                  height: 400,
                  onTapPet: () {
                    Modular.to.pushNamed(Routes.view.path, arguments: e);
                  },
                  urlImage: e,
                  petName: widget.pet.name,
                  nextCard: () {
                    photos.removeLast();
                    updateBloc(true);
                  },
                ),
              ),
            ).toList(),
          ],
        );
      },
    );
  }

  String publicationDate(DateTime createAt) {
    final difference = DateTime.now().difference(createAt);
    if (difference.inDays == 0) {
      return "há ${difference.inHours} horas";
    } else {
      if (difference.inDays > 1) {
        return "há ${difference.inDays} dias";
      } else {
        return "há 1 dia";
      }
    }
  }
}
