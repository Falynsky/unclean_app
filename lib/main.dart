import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unclean_app/http/http_consts.dart';
import 'package:unclean_app/http/services/auth/auth_service.dart';
import 'package:unclean_app/http/services/configuration/configuration_service.dart';
import 'package:unclean_app/http/services/transactions/transaction_service.dart';
import 'package:unclean_app/http/services/user/user_service.dart';
import 'package:unclean_app/l10n/generated/translations.dart';
import 'package:unclean_app/pages/screen_resolver/screen_resolver.dart';

Future<String> getTokenFromStorage() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('auth_token') ?? '';
}

Future<bool> setTokenInStorage(String token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('auth_token', token);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final ChopperClient chopper = ChopperClient(
    baseUrl: Uri.http(HttpConsts.serverUrl),
    converter: const JsonConverter(),
    services: <ChopperService>[
      ConfigurationService.create(),
      AuthService.create(),
      UserService.create(),
      TransactionService.create(),
    ],
    interceptors: <dynamic>[
      (Request request) async {
        final String token = await getTokenFromStorage();
        if (token.isNotEmpty) {
          return applyHeader(request, 'Auth', 'Wave $token');
        }
        return request;
      },
      (Response<dynamic> response) async {
        // get endpoint adress from chopper library response
        final String endpoint = response.base.request?.url.path ?? '';
        if (response.isSuccessful && endpoint.contains('/auth/login')) {
          final String token = response.body['data']['token'];
          await setTokenInStorage(token);
        }

        return response;
      },
    ],
  );

  GetIt.I.registerSingleton<ChopperClient>(chopper);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'unclean_app',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffffffff),
          body: ScreenResolver(),
        ),
      ),
      localizationsDelegates: Translations.localizationsDelegates,
      supportedLocales: Translations.supportedLocales,
      locale: Locale('pl'),
    );
  }

  void setupAppLifecycle() {
    WidgetsBinding.instance.addObserver(MyAppLifecycleObserver());
  }
}

class MyAppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      onAppTerminate();
    }
  }

  void onAppTerminate() {
    clearSharedPreferences();
  }

  void clearSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
