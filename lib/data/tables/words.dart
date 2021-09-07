import 'package:moor/moor.dart';

class Words extends Table {
  TextColumn get id => text()();
  TextColumn get word => text()();
}
