import 'package:chopper/chopper.dart';

part 'auth_service.chopper.dart';

@ChopperApi(baseUrl: '/auth')
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) => _$AuthService(client);

  @Post(path: '/login')
  Future<Response<Map<String, dynamic>>> login(
    @Body() Map<String, String> body,
  );
}
