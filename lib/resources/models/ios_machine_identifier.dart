enum IosMachineIdentifier {
  iPhone,
  iPhone3G,
  iPhone3GS,
  iPhone4,
  iPhone4S,
  iPhone5,
  iPhone5c,
  iPhone5s,
  iPhone6,
  iPhone6Plus,
  iPhone6s,
  iPhone6sPlus,
  iPhoneSE1st,
  iPhone7,
  iPhone7Plus,
  iPhone8,
  iPhone8Plus,
  iPhoneX,
  iPhoneXR,
  iPhoneXS,
  iPhoneXSMax,
  iPhone11,
  iPhone11Pro,
  iPhone11ProMax,
  iPhoneSE2nd,
  iPhone12mini,
  iPhone12,
  iPhone12Pro,
  iPhone12ProMax,
  other
}

extension IosMachineIdentifierExt on IosMachineIdentifier {
  bool existBottomBar() {
    switch (this) {
      case IosMachineIdentifier.iPhone:
      case IosMachineIdentifier.iPhone3G:
      case IosMachineIdentifier.iPhone3GS:
      case IosMachineIdentifier.iPhone4:
      case IosMachineIdentifier.iPhone4S:
      case IosMachineIdentifier.iPhone5:
      case IosMachineIdentifier.iPhone5s:
      case IosMachineIdentifier.iPhone5c:
      case IosMachineIdentifier.iPhone6:
      case IosMachineIdentifier.iPhone6Plus:
      case IosMachineIdentifier.iPhone6s:
      case IosMachineIdentifier.iPhone6sPlus:
      case IosMachineIdentifier.iPhoneSE1st:
      case IosMachineIdentifier.iPhone7:
      case IosMachineIdentifier.iPhone7Plus:
      case IosMachineIdentifier.iPhone8:
      case IosMachineIdentifier.iPhone8Plus:
      case IosMachineIdentifier.iPhoneSE2nd:
        return false;
      case IosMachineIdentifier.iPhoneX:
      case IosMachineIdentifier.iPhoneXR:
      case IosMachineIdentifier.iPhoneXS:
      case IosMachineIdentifier.iPhoneXSMax:
      case IosMachineIdentifier.iPhone11:
      case IosMachineIdentifier.iPhone11Pro:
      case IosMachineIdentifier.iPhone11ProMax:
      case IosMachineIdentifier.iPhone12mini:
      case IosMachineIdentifier.iPhone12:
      case IosMachineIdentifier.iPhone12Pro:
      case IosMachineIdentifier.iPhone12ProMax:
      case IosMachineIdentifier.other:
        return true;
    }
  }

  static IosMachineIdentifier from(String identifier) {
    switch (identifier) {
      case "iPhone1,1":
        return IosMachineIdentifier.iPhone;
      case "iPhone1,2":
        return IosMachineIdentifier.iPhone3G;
      case "iPhone2,1":
        return IosMachineIdentifier.iPhone3GS;
      case "iPhone3,1":
      case "iPhone3,2":
      case "iPhone3,3":
        return IosMachineIdentifier.iPhone4;
      case "iPhone4,1":
        return IosMachineIdentifier.iPhone4S;
      case "iPhone5,1":
      case "iPhone5,2":
        return IosMachineIdentifier.iPhone5;
      case "iPhone5,3":
      case "iPhone5,4":
        return IosMachineIdentifier.iPhone5c;
      case "iPhone6,1":
      case "iPhone6,2":
        return IosMachineIdentifier.iPhone5s;
      case "iPhone7,2":
        return IosMachineIdentifier.iPhone6;
      case "iPhone7,1":
        return IosMachineIdentifier.iPhone6Plus;
      case "iPhone8,1":
        return IosMachineIdentifier.iPhone6s;
      case "iPhone8,2":
        return IosMachineIdentifier.iPhone6sPlus;
      case "iPhone8,4":
        return IosMachineIdentifier.iPhoneSE1st;
      case "iPhone9,1":
      case "iPhone9,3":
        return IosMachineIdentifier.iPhone7;
      case "iPhone9,2":
      case "iPhone9,4":
        return IosMachineIdentifier.iPhone7Plus;
      case "iPhone10,1":
      case "iPhone10,4":
        return IosMachineIdentifier.iPhone8;
      case "iPhone10,2":
      case "iPhone10,5":
        return IosMachineIdentifier.iPhone8Plus;
      case "iPhone10,3":
      case "iPhone10,6":
        return IosMachineIdentifier.iPhoneX;
      case "iPhone11,8":
        return IosMachineIdentifier.iPhoneXR;
      case "iPhone11,2":
        return IosMachineIdentifier.iPhoneXS;
      case "iPhone11,6":
      case "iPhone11,4":
        return IosMachineIdentifier.iPhoneXSMax;
      case "iPhone12,1":
        return IosMachineIdentifier.iPhone11;
      case "iPhone12,3":
        return IosMachineIdentifier.iPhone11Pro;
      case "iPhone12,5":
        return IosMachineIdentifier.iPhone11ProMax;
      case "iPhone12,8":
        return IosMachineIdentifier.iPhoneSE2nd;
      case "iPhone13,1":
        return IosMachineIdentifier.iPhone12mini;
      case "iPhone13,2":
        return IosMachineIdentifier.iPhone12;
      case "iPhone13,3":
        return IosMachineIdentifier.iPhone12Pro;
      case "iPhone13,4":
        return IosMachineIdentifier.iPhone12ProMax;
      default:
        // TODO: ログを残すことで iOS が更新されたことを検知できるようにする
        return IosMachineIdentifier.other;
    }
  }
}