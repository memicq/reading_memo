import 'package:flutter/material.dart';

class SettingItemButton extends StatelessWidget {
  final Widget content;
  final IconData iconData;
  final Function onPressed;
  final bool needTopSpace;
  final bool needBottomSpace;

  SettingItemButton({
    @required this.content,
    @required this.onPressed,
    this.iconData,
    this.needTopSpace = false,
    this.needBottomSpace = false,
  });

  Widget buildIconContainer() {
    return Container(
      width: 50,
      constraints: BoxConstraints(minHeight: 50),
      child: Icon(iconData),
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderSide _borderSide = BorderSide(color: Color(0xFFDDDDDD), width: 0.5);
    const double paddingSpacePx = 20;
    EdgeInsetsGeometry _padding = EdgeInsets.only(
      top: needTopSpace ? paddingSpacePx : 0,
      bottom: needTopSpace ? paddingSpacePx : 0,
    );
    List<Widget> _iconContainerList =
        (iconData != null) ? [buildIconContainer()] : List.empty();

    return Container(
      padding: _padding,
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => onPressed(),
          child: Container(
            constraints: BoxConstraints(minHeight: 50),
            decoration: BoxDecoration(
              border: Border(
                top: _borderSide,
                bottom: _borderSide,
              ),
            ),
            child: Row(
              children: _iconContainerList +
                  [
                    Expanded(
                      child: this.content,
                    )
                  ],
            ),
          ),
        ),
      ),
    );
  }
}
