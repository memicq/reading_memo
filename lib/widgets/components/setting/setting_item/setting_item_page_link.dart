import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingItemPageLink extends StatelessWidget {
  final Widget content;
  final IconData iconData;
  final Widget templateScaffold;
  final bool needTopSpace;
  final bool needBottomSpace;

  SettingItemPageLink({
    @required this.content,
    @required this.iconData,
    @required this.templateScaffold,
    this.needTopSpace = false,
    this.needBottomSpace = false,
  });

  @override
  Widget build(BuildContext context) {
    BorderSide _borderSide = BorderSide(color: Color(0xFFDDDDDD), width: 0.5);
    const double paddingSpacePx = 20;
    EdgeInsetsGeometry _padding = EdgeInsets.only(
      top: needTopSpace ? paddingSpacePx : 0,
      bottom: needTopSpace ? paddingSpacePx : 0,
    );

    return Container(
      padding: _padding,
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => this.templateScaffold));
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: _borderSide,
                bottom: _borderSide,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  constraints: BoxConstraints(minHeight: 50),
                  child: Icon(iconData),
                ),
                Expanded(
                  child: this.content,
                ),
                Container(
                  width: 50,
                  constraints: BoxConstraints(minHeight: 50),
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
