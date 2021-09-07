import 'package:moor_flutter/moor_flutter.dart';
import 'package:test_db_module/data/tables/words.dart';
part 'carrot_test_db.g.dart';

@UseMoor(tables: [Words])
class CarrotTestDb extends _$CarrotTestDb {
  CarrotTestDb()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'carrot_db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
