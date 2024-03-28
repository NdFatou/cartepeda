import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../res/app_icons.dart';
import '../res/app_image.dart';
import '../res/app_logo.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

 @override
  Size get preferredSize => Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
     // bottom: PreferredSize(preferredSize: Size(1, 1), child: Divider()),
      titleSpacing: 2,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      automaticallyImplyLeading: false,
      title: Image.asset(
        AppLogo.logo,
        fit: BoxFit.fill,
        width: 125,
        height: 35,
        alignment: Alignment.center,
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: SvgPicture.asset(AppIcons.menuIcons),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppIcons.notificationIcons),
        ),
        CircleAvatar(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          backgroundImage: AssetImage(AppImage.photo),
          radius: 20,
        ),
        Padding(padding: EdgeInsets.only(right: 15))
      ],
    );
  }
}
