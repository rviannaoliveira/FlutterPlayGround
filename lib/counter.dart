import 'package:mobx/mobx.dart';
part 'counter.g.dart';

class Counter = _BaseCounter with _$Counter;

abstract class _BaseCounter with Store {
  @observable
  int value = 0;

  @action
  increment() {
    value++;
  }
}
