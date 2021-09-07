import 'package:get_it/get_it.dart';
import 'package:test_db_module/data/carrot_test_db.dart';
import 'package:test_db_module/data/daos/word_dao.dart';
import 'package:test_db_module/data/repos/words_repository.dart';
import 'package:test_db_module/domain/get_words_uc.dart';
import 'package:test_db_module/domain/insert_word_uc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Repository
  sl.registerLazySingleton<WordsRepository>(() {
    return WordsRepository();
  });

  //DB
  sl.registerLazySingleton<CarrotTestDb>(() => CarrotTestDb());
  sl.registerLazySingleton<WordDao>(() => WordDao(sl()));

  //Use cases
  sl.registerLazySingleton<GetAllWordsUseCase>(() => GetAllWordsUseCase());
  sl.registerLazySingleton<InsertWordUseCase>(() => InsertWordUseCase());
}
