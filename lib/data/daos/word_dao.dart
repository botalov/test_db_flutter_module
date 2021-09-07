import 'package:moor_flutter/moor_flutter.dart';
import 'package:test_db_module/data/carrot_test_db.dart';
import 'package:test_db_module/data/tables/words.dart';
part 'word_dao.g.dart';

@UseDao(tables: [Words])
class WordDao extends DatabaseAccessor<CarrotTestDb> with _$WordDaoMixin {
  WordDao(CarrotTestDb db) : super(db);

  Stream<List<Word>> getAllWords() {
    try {
      return (select(words)).watch();
    } catch (e) {
      print("XTEST: При получении списка слов произошла ошибка: $e");
      return Stream.empty();
    }
  }

  Future insertWord(Word word) {
    try {
      return into(words).insert(word, mode: InsertMode.insertOrReplace);
    } catch (e) {
      print("XTEST: При вставке слова произошла ошибка: $e");
      return Future.value();
    }
  }
}
