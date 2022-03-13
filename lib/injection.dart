import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:note_clean_architecture/injection.config.dart';
// import 'injection.config.dart';

final GetIt getIt = GetIt.instance;
// @InjectableInit(
//   initializerName: r'$initGetIt', // default
//   preferRelativeImports: true, // default
//   asExtension: false,
// )
@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
