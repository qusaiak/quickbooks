import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/theme/colors.dart';
import '../bloc/base_bloc.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
      //initialLocation: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return BlocConsumer<BaseBloc, BaseState>(
      listener: (context, state) {
        if (state.baseStatus == BaseStatus.changeBottomNavBarIndex) {
          _goToBranch(state.currentIndex!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          backgroundColor: AppColor.transparent,
          body: PopScope(
            canPop: state.currentIndex == 0,
            onPopInvokedWithResult: (val, object) {
              BlocProvider.of<BaseBloc>(context)
                  .add(const ChangeBottomNavBarIndex(0));
            },
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: widget.navigationShell,
                ),
              ],
            ),
          ),
          bottomNavigationBar: !state.isShown!
              ? null
              : Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          theme.surface,
                          theme.surface.withOpacity(0.98),
                          theme.surface.withOpacity(0.95),
                          theme.surface.withOpacity(0.9),
                        ],
                      ),
                    ),
                    child: BottomNavigationBar(
                      backgroundColor: Colors.transparent,
                      type: BottomNavigationBarType.fixed,
                      elevation: 0.0,
                      currentIndex: state.currentIndex!,
                      onTap: (newIndex) {
                        context
                            .read<BaseBloc>()
                            .add(ChangeBottomNavBarIndex(newIndex));
                      },
                      items: [
                        BottomNavigationBarItem(
                          icon: const Icon(Icons.home),
                          label: "Home",
                        ),
                        BottomNavigationBarItem(
                          icon: const Icon(Icons.search_outlined),
                          label: "Search",
                        ),
                        BottomNavigationBarItem(
                          icon: const Icon(Icons.my_library_books_outlined),
                          label: "My Booking",
                        ),
                        BottomNavigationBarItem(
                          icon: const Icon(Icons.calendar_month_outlined),
                          label: "Calendar",
                        ),
                      ],
                    ),
                  ),
                ),

        );
      },
    );
  }
}
