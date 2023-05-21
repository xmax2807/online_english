import 'dart:convert';
import 'dart:io';
import 'dart:developer' as dev;
import 'package:path_provider/path_provider.dart';

abstract class PathProviderIO {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<T> read<T>(String filePath) async {
    try {
      final local = await _localPath;
      final File fullPath = File('$local/$filePath');

      final contents = await fullPath.readAsString();

      return tryParseContent(contents);
    } catch (e) {
      return errorParse();
    }
  }

  Future write<T>(T object, String filePath) async {
    try {
      final local = await _localPath;
      final File fullPath = File('$local/$filePath');

      final data = toStringContent(object);
      await fullPath.writeAsString(data);
    } catch (e) {
      dev.log(e.toString());
    }
  }

  T? tryParseContent<T>(String contents);
  String toStringContent<T>(T object);
  T? errorParse<T>();
}

class JsonPathProvider extends PathProviderIO {
  @override
  T? tryParseContent<T>(String contents) {
    return jsonDecode(contents);
  }

  @override
  String toStringContent<T>(T object) {
    return jsonEncode(object);
  }

  @override
  T? errorParse<T>() => null;
}
