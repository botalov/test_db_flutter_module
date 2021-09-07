import 'package:get_it/get_it.dart';
import 'package:test_db_module/data/repos/words_repository.dart';

class InsertWordUseCase {
  WordsRepository _wordsRepository = GetIt.instance.get<WordsRepository>();

  void call(String word) {
    print(
        "XTEST: Вызвали юзкейс для вставки нового слова в БД. Это слово - $word");
    _wordsRepository.insertWord(word);
  }
}
