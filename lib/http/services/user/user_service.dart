import 'package:chopper/chopper.dart';

part 'user_service.chopper.dart';

@ChopperApi(baseUrl: '/users')
abstract class UserService extends ChopperService {
  static UserService create([ChopperClient? client]) => _$UserService(client);

  @Get()
  Future<Response<Map<String, Object?>>> getTodos();
}
