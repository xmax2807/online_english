import 'package:online_english/utils/io/path_provider_io.dart';

abstract class ISavable {
  Future getData(PathProviderIO fileIO);
  Future writeData(PathProviderIO fileIO);
}
