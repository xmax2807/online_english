import 'dart:convert';
import 'dart:io';
import 'dart:developer' as dev;
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

  Future write(T object, String filePath) async {
    try {
      final local = await _localPath;
      final File fullPath = File('$local/$filePath');

      final data = toStringContent(object);
      await fullPath.writeAsString(data);
    } catch (e) {
      dev.log(e.toString());
    }
  }

  T tryParseContent(String contents);
  String toStringContent(T object);
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

  @override
  String toStringContent(T? object) {
    return jsonEncode(object);
  }
}
