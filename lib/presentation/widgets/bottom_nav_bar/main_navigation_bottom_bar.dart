part of widgets;

class MainNavigationBottomBar extends StatelessWidget {
  const MainNavigationBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: AspectRatio(
            aspectRatio: 374 / 90,
            child: Stack(alignment: Alignment.center, children: [
              Container(
                  decoration: const BoxDecoration(
                    color: AppPalette.whiteColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 8.w,
                        right: 8.w,
                        bottom: MediaQuery.of(context).viewPadding.bottom),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BottomBarItem(icon: Icons.calculate, index: 0),
                        BottomBarItem(icon: Icons.history, index: 1),
                        BottomBarItem(icon: Icons.language_rounded, index: 2),
                      ],
                    ),
                  )),
            ])));
  }
}
