import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/styles/color.dart';

class MainButton extends StatelessWidget {
  MainButton({Key? key, this.text = "", this.onPressed}) : super(key: key);

  String text;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: onPressed,
        child: Container(
          height: 35,
          decoration: BoxDecoration(
              color:
                  onPressed != null ? ColorsStyle.mainColor : ColorsStyle.gray,
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: onPressed != null ? null : ColorsStyle.darkGray),
            ),
          ),
        ));
  }
}

class CustomOutlineButton extends StatelessWidget {
  CustomOutlineButton({Key? key, this.text = "", this.onPressed})
      : super(key: key);

  String text;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: onPressed,
        child: Container(
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: ColorsStyle.white),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ));
  }
}
