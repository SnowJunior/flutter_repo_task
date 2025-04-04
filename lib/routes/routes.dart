import 'package:github/presentation/screens/home_main_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomeMainScreen, initial: true)
], dependencies: [
  LazySingleton(classType: NavigationService)
])

class App {}