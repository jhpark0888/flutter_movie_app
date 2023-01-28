import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/styles/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, this.title}) : super(key: key);

  String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: ColorsStyle.white),
            )
          : null,
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 27,
          )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
