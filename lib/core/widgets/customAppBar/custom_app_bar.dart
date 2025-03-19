import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yritys_app/core/app_theme.dart';
import 'package:yritys_app/core/widgets/customAppBar/bloc/custom_app_bar_cubit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: appTheme.primaryColor,
      title: BlocBuilder<CustomAppBarCubit, String>(builder: (context, title) {
        return Text(title);
      }),
      titleTextStyle: TextStyle(
          fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
