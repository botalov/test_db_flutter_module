import 'package:get_it/get_it.dart';
import 'package:test_db_module/data/repos/words_repository.dart';

class GetAllWordsUseCase {
  WordsRepository _wordsRepository = GetIt.instance.get<WordsRepository>();

  Stream<List<String>> call() {
    print("XTEST: Вызвали юзкейс для получения все слов");
    Stream<List<String>> resStream = _wordsRepository.getAllWords();
    resStream.listen((event) {
      print(
          "XTEST: Сработал слушатель потока в юзкейсе. Всего пришло сюда ${event.length.toString()} слов");
    });
    return resStream;
  }
}
