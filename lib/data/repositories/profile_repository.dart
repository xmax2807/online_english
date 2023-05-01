import 'package:dio/dio.dart';
import 'package:online_english/data/model/user_data_source/user_model.dart';
import 'package:online_english/utils/global_constants/api_keys.dart';
import 'dart:developer' as dev;

abstract class IProfileRepository {
  Future<UserModel?> getProfile();
  Future<String?> updateAvatar(String filePath);
}

class ProfileRepository implements IProfileRepository {
  final Dio _dio;

  ProfileRepository(this._dio);

  List? _onError(dynamic error) {
    if (error is DioError) {
      dev.log(error.message.toString());
      dev.log(
          error.response == null ? 'null' : error.response!.data.toString());
    }
    return null;
  }

  @override
  Future<UserModel?> getProfile() {
    return _dio.get(ApiKeys.userProfile).then((value) {
      if (value.data == null) return null;
      return UserModel.fromJson(value.data['user']);
    }, onError: _onError);
  }

  @override
  Future<String?> updateAvatar(String filePath) async {
    final MultipartFile data = await MultipartFile.fromFile(filePath);
    final formData = FormData.fromMap({'avatar': data});
    return _dio
        .post(ApiKeys.updateAvatar,
            data: formData,
            options: Options(headers: {
              'accept-encoding': 'gzip, deflate, br',
            }))
        .then((value) {
      if (value.data == null) return null;
      return value.data['avatar'] as String;
    }, onError: _onError);
  }
}
