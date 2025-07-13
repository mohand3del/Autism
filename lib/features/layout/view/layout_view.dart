import 'package:autism/features/layout/view/widget/bottom_nav_bar.dart';
import 'package:autism/features/layout/viewModel/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/layout_state.dart';

// RouteObserver to track navigation
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> with RouteAware {
  late LayoutCubit _layoutCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _layoutCubit = LayoutCubit.get(context);

    // Register with RouteObserver
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // This is called when user returns to this screen from another screen
    // Force refresh the navigation state
    if (mounted) {
      setState(() {
        // Explicitly force rebuild of the view
        _layoutCubit.changeCurrentIndex(_layoutCubit.currentIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          body: IndexedStack(
            index: cubit.currentIndex,
            children: cubit.screens,
          ),
          bottomNavigationBar: Visibility(
            // Explicitly control visibility based on current state
            visible: !cubit.shouldHideNavBar(cubit.currentIndex),
            child: const BottomNavBar(),
          ),
        );
      },
    );
  }
}
