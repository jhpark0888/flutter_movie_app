import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/styles/color.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.label = "",
    this.hintText,
    this.errorText,
    this.keyboardType,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  String label;
  String? hintText;
  String? errorText;
  TextInputType? keyboardType;
  Function(String)? onChanged;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(context),
        const SizedBox(height: 4),
        TextField(
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyText1,
          cursorColor: ColorsStyle.white,
          keyboardType: keyboardType,
          onChanged: onChanged,
          obscureText: obscureText,
          decoration: _inputdecoration(context),
        ),
      ],
    );
  }

  Widget _label(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  InputDecoration _inputdecoration(BuildContext context) {
    return InputDecoration(
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorsStyle.white, width: 1),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorsStyle.white, width: 1),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorsStyle.white, width: 1),
      ),
      disabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorsStyle.white, width: 1),
      ),
      hintStyle: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(color: ColorsStyle.gray),
      hintText: hintText,
      errorStyle: Theme.of(context)
          .textTheme
          .caption
          ?.copyWith(color: ColorsStyle.notReleased),
      errorText: errorText,
    );
  }
}
