import 'package:autism/features/layout/viewModel/layout_cubit.dart';
import 'package:autism/features/layout/viewModel/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;


    double navBarHeight = screenHeight * 70 / 932;
    double navBarWidth = screenWidth * 395 / 430;
    double iconSize = screenWidth * 25 / 430;

    return SafeArea( // Use SafeArea to respect screen's safe zones
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = LayoutCubit.get(context);
          return Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 18 / 430),
            width: navBarWidth,
            height: navBarHeight,
            child: Material(
              elevation: 5, // Elevation for shadow effect
              borderRadius: BorderRadius.circular(50), // Circular shape
              color: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: BottomNavigationBar(
                  onTap: (index) {
                    cubit.changeCurrentIndex(index);
                  },
                  type: BottomNavigationBarType.fixed,
                  currentIndex: cubit.currentIndex,
                  unselectedItemColor: const Color(0xff67687E),
                  selectedItemColor: const Color(0xff3F80FF),
                  backgroundColor: Colors.white,
                  showUnselectedLabels: true,
                  items:  [
                    BottomNavigationBarItem(
                      label: 'Home',
                      icon: Icon(FontAwesomeIcons.houseChimney,size: iconSize),
                    ),
                    BottomNavigationBarItem(
                      label: 'Test',
                      icon: Icon(FontAwesomeIcons.newspaper,size: iconSize),
                    ),
                    BottomNavigationBarItem(
                      label: 'Community',
                      icon: Icon(FontAwesomeIcons.users,size: iconSize),
                    ),
                    BottomNavigationBarItem(
                      label: 'Resources',
                      icon: Icon(FontAwesomeIcons.bookOpen,size: iconSize),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
