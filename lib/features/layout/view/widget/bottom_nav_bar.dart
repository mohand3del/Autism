import 'package:autism/features/layout/viewModel/layout_cubit.dart';
import 'package:autism/features/layout/viewModel/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    double navBarHeight = screenHeight * 70 / 932;
    double navBarWidth = screenWidth * 395 / 430;
    double iconSize = screenWidth * 25 / 430;

    return SafeArea(
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = LayoutCubit.get(context);

          // Hide or show the BottomNavBar based on onboarding status
          return cubit.shouldHideNavBar(cubit.currentIndex)
              ? const SizedBox() // Hide the BottomNavBar if needed
              : Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 18 / 430),
                    width: navBarWidth,
                    height: navBarHeight,
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(50),
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
                          items: [
                            BottomNavigationBarItem(
                              label: 'Home',
                              icon: SvgPicture.asset(
                                'assets/images/home.svg',
                                colorFilter: ColorFilter.mode(
                                  cubit.currentIndex == 0
                                      ? const Color(0xff3F80FF)
                                      : const Color(0xff67687E),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            BottomNavigationBarItem(
                              label: 'Test',
                              icon: Icon(
                                FontAwesomeIcons.newspaper,
                                size: iconSize,
                                color: cubit.currentIndex == 1
                                    ? const Color(0xff3F80FF)
                                    : const Color(0xff67687E),
                              ),
                            ),
                            BottomNavigationBarItem(

                              label: 'Community',
                              icon: Icon(
                                FontAwesomeIcons.users,
                                size: iconSize,
                                color: cubit.currentIndex == 2
                                    ? const Color(0xff3F80FF)
                                    : const Color(0xff67687E),
                              ),
                            ),
                            BottomNavigationBarItem(
                              label: 'Resources',
                              icon: SvgPicture.asset(
                                'assets/images/resource.svg',
                                colorFilter: ColorFilter.mode(
                                  cubit.currentIndex == 3
                                      ? const Color(0xff3F80FF)
                                      : const Color(0xff67687E),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            BottomNavigationBarItem(
                              label: 'Doctors',
                              icon: SvgPicture.asset(
                                'assets/images/doctors.svg',
                                colorFilter: ColorFilter.mode(
                                  cubit.currentIndex == 4
                                      ? const Color(0xff3F80FF)
                                      : const Color(0xff67687E),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}

