import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final bool loading;
  final String title;
  const DefaultButton({Key? key, required this.onPressed, required this.width, required this.loading, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: loading ? 80 : width,
      height: 50,
      child: MaterialButton(
          onPressed: onPressed,
          color: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          child: switch(loading) {
            true => const Center(
              child: CircularProgressIndicator(color: Colors.white,),
            ),
            _ => Text(title, style: TextStyles.button,)
          },

    ),
    );
  }
}
