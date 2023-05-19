import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

abstract class PathProviderIO<T> {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<T> read(String filePath) async {
    try {
      final local = await _localPath;
      final File fullPath = File('$local/$filePath');

      final contents = await fullPath.readAsString();

      return tryParseContent(contents);
    } catch (e) {
      return errorParse();
    }
  }

  T tryParseContent(String contents);
  T errorParse();
}

class JsonPathProvider<T> extends PathProviderIO<T?> {
  @override
  T? errorParse() {
    return null;
  }

  @override
  T tryParseContent(String contents) {
    return jsonDecode(contents);
  }
}
