part of widgets;

class BottomBarItem extends StatelessWidget {
  final int index;
  final IconData icon;

  const BottomBarItem({
    Key? key,
    required this.index,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = context.watch<NavigationTabController>();
    final _isActive = _provider.isActive(index);
    return GestureDetector(
        onTap: () => _provider.jumpToTab(index),
        child: Container(
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _isActive ? AppPalette.mainBlueColor : AppPalette.whiteColor,
          ),
          child: Icon(
            icon,
            color: _isActive
                ? AppPalette.whiteColor
                : AppPalette.bottomNavigationDeactiveColor,
            size: 4.h,
          ),
        ));
  }
}
