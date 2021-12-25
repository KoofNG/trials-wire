import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wirepay/modules/home_module/data/bottom_menu.dart';

class BottomNavBarItem extends StatelessWidget {
  final BottomMenuButton item;
  final bool isActive;

  const BottomNavBarItem({
    Key key,
    this.item,
    bool isActive = false,
  })  : isActive = isActive,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30.0,
          decoration: BoxDecoration(),
          child: Icon(
            item.buttonIcon,
            color: isActive ? Colors.blue[400] : Colors.black12,
            size: 34.0,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          item.buttonName,
          style: TextStyle(
            color: isActive ? Colors.blue[400] : Colors.black,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
