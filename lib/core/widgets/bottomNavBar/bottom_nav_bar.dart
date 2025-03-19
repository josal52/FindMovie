import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yritys_app/core/widgets/bottomNavBar/bloc/bottom_nav_bar_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  void _onItemPressed(BuildContext context, int index) {
    context.read<BottomNavBarCubit>().selectPage(index);

    switch (index) {
      case 0:
        context.go('/search');
        break;
      case 1:
        context.go('/favorites');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(builder: (context, state) {
      return BottomNavigationBar(
          currentIndex: state,
          onTap: (index) => _onItemPressed(context, index),
          items: [
            const BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search),
            ),
            const BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(Icons.favorite),
            ),
          ]);
    });
  }
}
