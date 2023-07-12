import 'package:firebase_flutter_fujitsu/modules/ecomerce/cubits/bikes_cubit/bikes_cubit.dart';
import 'package:firebase_flutter_fujitsu/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BicicletasFormPage extends StatelessWidget {
  const BicicletasFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nameBike = TextEditingController();
    TextEditingController typeBike = TextEditingController();
    TextEditingController descriptionBike = TextEditingController();
    FormValidator formValidator = FormValidator();
    return BlocProvider<BikesCubit>(
      create: (context) => BikesCubit(),
      child: BlocBuilder<BikesCubit, BikesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body: ListView(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        controller: nameBike,
                        validator: formValidator.isValidName,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: "Nombre de la bici",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        controller: typeBike,
                        validator: formValidator.isValidName,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: "Tipo de bici",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        controller: descriptionBike,
                        validator: formValidator.isValidName,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: "Descripción de la bici",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            print("Este formulario es verdadero");
                            context.read<BikesCubit>().createNewBike(
                                  uidBike: '${nameBike.text}${typeBike.text}',
                                  nameBike: nameBike.text,
                                  typeBike: typeBike.text,
                                  descriptionBike: descriptionBike.text,
                                );
                          } else {
                            print("Vuelve a intentarlo");
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          color: Colors.yellow,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
