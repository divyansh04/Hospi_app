
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data_services.dart';
import 'moduleServices/authentication_service.dart';
import 'moduleServices/local_storage_service.dart';
import 'moduleServices/userServices.dart';
import 'shared_pref_service/shared_pref_service.dart';

GetIt sl = GetIt.instance;

Future<void> servicesSetup() async {

  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPrefs);


  LocalStorageService localStorageService =
      await LocalStorageService.getInstance();


  sl.registerSingleton<LocalStorageService>(localStorageService);

  sl.registerSingleton<UserService>(UserService());

  sl.registerFactory<AuthenticationService>(() => AuthenticationService());
  sl.registerFactory<GetDataService>(() => GetDataService());

  sl.registerSingleton<SharedPrefService>(SharedPrefService(sharedPrefs));
}
