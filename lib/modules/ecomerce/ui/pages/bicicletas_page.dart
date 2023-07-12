import 'package:firebase_flutter_fujitsu/core/locator/locator.dart';
import 'package:firebase_flutter_fujitsu/core/router/app_router.dart';
import 'package:firebase_flutter_fujitsu/modules/ecomerce/cubits/bikes_cubit/bikes_cubit.dart';
import 'package:firebase_flutter_fujitsu/modules/ecomerce/data/models/bike_model.dart';
import 'package:firebase_flutter_fujitsu/modules/ecomerce/ui/widgets/bike_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BicicletasPage extends StatelessWidget {
  const BicicletasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await unRegisterCubits();
          // ignore: use_build_context_synchronously
          context.goNamed(AppRoutes.formBicicletas.name);

          // await registerCubits();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<BikesCubit, BikesState>(
        bloc: locator<BikesCubit>(),
        builder: (context, state) {
          return ListView.builder(
              // itemCount: state.bikeS.length,
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    print(
                        "Esta es la navegación con go router a la descripción de mi bici");

                    // context.pushNamed(
                    //   AppRoutes.desBicicleta.name,
                    //   extra: BikeDescriptionWidgetObject(
                    //       bikeModel: state.bicis[index]),
                    // );

                    context.pushNamed(
                      AppRoutes.desBicicleta.name,
                      extra: BikeDescriptionWidgetObject(
                        bikeModel: BikeModel(
                          title: 'Esta es mi bici',
                          desc: 'Esta es la desc',
                        ),
                      ),
                    );
                  },
                  // title: state.bici[index].name,
                  // subtitle: state.bici[index].type,
                  title: Text('Este es el nombre de mi bici'),
                  subtitle: Text('Este es el tipo de mi bici'),
                  leading: Icon(Icons.access_alarm),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                );
              });
        },
      ),
    );
  }
}
