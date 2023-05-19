abstract class ISavable<T> {
  Future<T?> getData();
  Future writeData();
}

abstract class ISavableAsJson<T> implements ISavable<T> {}
