import 'package:moor_flutter/moor_flutter.dart';
import 'package:test_db_module/data/carrot_test_db.dart';
import 'package:test_db_module/data/tables/words.dart';
part 'word_dao.g.dart';

@UseDao(tables: [Words])
class WordDao extends DatabaseAccessor<CarrotTestDb> with _$WordDaoMixin {
  WordDao(CarrotTestDb db) : super(db);

  Stream<List<Word>> getAllWords() => (select(words)).watch();

  Future insertWord(Word word) =>
      into(words).insert(word, mode: InsertMode.insertOrReplace);
}
