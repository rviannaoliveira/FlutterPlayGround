import 'package:flutterapp/character/data/character_repository.dart';
import 'package:flutterapp/character/data/model/character.dart';
import 'package:mobx/mobx.dart';
part 'main_view_model.g.dart';

class MainViewModel = _BaseMainViewModel with _$MainViewModel;

abstract class _BaseMainViewModel with Store {
  final CharacterRepository repository;

  _BaseMainViewModel({this.repository});

  @observable
  int value = 0;

  @observable
  ObservableFuture<Character> character;

  @action
  increment() {
    value++;
  }

  @action
  Future<void> onButtonPressed() async {
     return character = repository.callId(value).asObservable();
  }
}
