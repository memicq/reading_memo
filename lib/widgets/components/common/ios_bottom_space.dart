import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reading_memo/resources/models/ios_machine_identifier.dart';

class IosBottomSpace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IosBottomSpaceState();
}

class IosBottomSpaceState extends State<IosBottomSpace> {
  bool _needBottomSpace = true;
  static const double bottomSpacePx = 20;

  @override
  void initState() {
    super.initState();
    this._init();
  }

  Future<void> _init() async {
    await _fetchDeviceInfo();
  }

  Future<void> _fetchDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    String machineIdentifier = iosInfo.utsname.machine;
    IosMachineIdentifier machineVer =
        IosMachineIdentifierExt.from(machineIdentifier);
    setState(() {
      this._needBottomSpace = machineVer.existBottomBar();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this._needBottomSpace)
      return Container(
        height: bottomSpacePx,
        width: double.infinity,
        color: Colors.transparent,
      );
    else
      return Container();
  }
}
