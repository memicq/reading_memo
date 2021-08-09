
import 'package:uuid/uuid.dart';

class UniqueIdUtil {
  // for singleton
  static final UniqueIdUtil _instance = UniqueIdUtil._internal();
  factory UniqueIdUtil() => _instance;
  UniqueIdUtil._internal();

  Uuid _uuid = Uuid();

  String generateId() {
    return _uuid.v1();
  }
}