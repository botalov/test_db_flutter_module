import 'dart:math';
import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:test_db_module/data/daos/word_dao.dart';
import 'package:test_db_module/data/carrot_test_db.dart' as DB;

class WordsRepository {
  final WordDao _wordDao = GetIt.instance.get<WordDao>();

  void insertWord(String wordValue) {
    print(
        "XTETS: Вызвали метод вставки нового слова ($wordValue) у репозитория");
    final id = Random.secure().nextInt(4294967295).toString();
    DB.Word word = DB.Word(id: id, word: wordValue);
    _wordDao.insertWord(word);
  }

  Stream<List<String>> getAllWords() {
    print("XTETS: Вызвали метод получения всех слов у репозитория");
    return _wordDao
        .getAllWords()
        .map((event) => event.map((e) => e.word).toList());
  }
}
