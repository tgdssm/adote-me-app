import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final bool loading;
  final String title;
  final bool disable;
  const DefaultButton(
      {Key? key,
      required this.onPressed,
      required this.width,
      required this.title,
      this.loading = false,
      this.disable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: loading ? 80 : width,
      height: 50,
      child: MaterialButton(
        onPressed: disable ? null : onPressed,
        color: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: switch (loading) {
          true => const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          _ => Text(
              title,
              style: TextStyles.button,
            )
        },
      ),
    );
  }
}
