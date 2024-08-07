// import 'package:dome/core/models/api_user_model.dart';
import 'package:dome/core/navigation/navigation.dart';
// import 'package:dome/core/network/network_service.dart';
import 'package:dome/core/storage/local_db.dart';
import 'package:dome/res/theme/theme_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

//global variables

String gBToken = "";

// ApiUserModel? loggedInUser;

// dependencies
GetIt locator = GetIt.instance;
Future<void> setUpLocator() async {
  locator.registerLazySingleton(
    () => ThemeService(),
  );
  locator.registerLazySingleton(
    () => AppRouter(),
  );
  // locator.registerLazySingleton(
  //   () => BWidgetsBottomSheets.instance,
  // );

  // locator.registerLazySingleton(
  //   () => AuthService(),
  // );
  // locator.registerLazySingleton(
  //   () => WalletService(),
  // );
  // locator.registerLazySingleton(
  //   () => ProfileService(),
  // );
  // locator.registerLazySingleton(
  //   () => ServicesRepo(),
  // );
  // locator.registerLazySingleton(
  //   () => ImageSelector(),
  // );
}

final appRouter = locator<AppRouter>();
// final bottomSheetService = locator<BWidgetsBottomSheets>();
final blocalDB = BLocalDB.instance;
final secureDbInstance = LocalDb();
// final authenticationService = locator<AuthService>();
// final walletService = locator<WalletService>();
// final profileService = locator<ProfileService>();
// final servicesR = locator<ServicesRepo>();
// final imageService = locator<ImageSelector>();
//controllers
List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => ThemeService()),
  // ChangeNotifierProvider(create: (context) => DashBoardViewModel()),
];

class UserContants {}

//
