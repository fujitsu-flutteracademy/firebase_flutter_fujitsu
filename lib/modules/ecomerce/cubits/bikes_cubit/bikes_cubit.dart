import 'package:firebase_flutter_fujitsu/modules/ecomerce/data/services/firestore_service_bikes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bikes_state.dart';

//TODO
class BikesCubit extends Cubit<BikesState> {
  FirestoreServicesBikes firestoreServicesBikes = FirestoreServicesBikes();
  BikesCubit() : super(BikesInitial());

  Future<void> init() async {
    print("Función inicial");
  }

  Future<void> createNewBike({
    required String uidBike,
    required String nameBike,
    required String typeBike,
    required String descriptionBike,
  }) async {
    await firestoreServicesBikes.createNewBike(
      uidBike: uidBike,
      nameBike: nameBike,
      typeBike: typeBike,
      descriptionBike: descriptionBike,
    );
  }
}
