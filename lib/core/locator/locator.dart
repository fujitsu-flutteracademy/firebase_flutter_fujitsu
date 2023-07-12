import 'package:firebase_flutter_fujitsu/modules/auth/cubits/user_cubit/user_cubit.dart';
import 'package:firebase_flutter_fujitsu/modules/ecomerce/cubits/bikes_cubit/bikes_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  await registerCubits();
}

registerCubits() async {
  if (!locator.isRegistered<BikesCubit>()) {
    locator.registerLazySingleton(
      () => BikesCubit()..init(),
    );
  }

  // if (!locator.isRegistered<UserCubit>()) {
  //   locator.registerLazySingleton(
  //     () => UserCubit(),
  //   );
  // }
}

unRegisterCubits() async {
  await locator.unregister<BikesCubit>();
  // locator.unregister<UserCubit>();
}
