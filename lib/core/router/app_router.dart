import 'package:firebase_flutter_fujitsu/modules/auth/ui/pages/sign_in_page.dart';
import 'package:firebase_flutter_fujitsu/modules/chat/ui/pages/chat_page.dart';
import 'package:firebase_flutter_fujitsu/modules/ecomerce/ui/pages/bicicletas_form_page.dart';
import 'package:firebase_flutter_fujitsu/modules/ecomerce/ui/pages/bicicletas_page.dart';
import 'package:firebase_flutter_fujitsu/modules/ecomerce/ui/pages/camisetas_page.dart';
import 'package:firebase_flutter_fujitsu/modules/ecomerce/ui/pages/ecomerce_page.dart';
import 'package:firebase_flutter_fujitsu/modules/ecomerce/ui/widgets/bike_description_widget.dart';
import 'package:firebase_flutter_fujitsu/modules/home/ui/pages/home_page.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  startApp,
  login,
  register,
  ecomerce,
  camisetas,
  bicicletas,
  formBicicletas,
  desBicicleta,
  chat,
}

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.startApp.name,
      builder: (context, state) {
        return HomePage();
      },
      routes: [
        GoRoute(
          path: 'ecomerce',
          name: AppRoutes.ecomerce.name,
          builder: (context, state) {
            return EcomercePage();
          },
          routes: [
            GoRoute(
              path: 'camisetas',
              name: AppRoutes.camisetas.name,
              builder: (context, state) {
                return CamisetasPage();
              },
            ),
            GoRoute(
              path: 'bicicletas',
              name: AppRoutes.bicicletas.name,
              builder: (context, state) {
                return BicicletasPage();
              },
              routes: [
                GoRoute(
                  path: 'formBicicletas',
                  name: AppRoutes.formBicicletas.name,
                  builder: (context, state) {
                    return BicicletasFormPage();
                  },
                ),
                GoRoute(
                  path: 'descBicicleta',
                  name: AppRoutes.desBicicleta.name,
                  builder: (context, state) {
                    return BikeDescriptionWidget(
                      bikeModelObject:
                          state.extra as BikeDescriptionWidgetObject,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
            path: 'chat',
            name: AppRoutes.chat.name,
            builder: (context, state) {
              return ChatPage();
            }),
      ],
    ),
  ],
);
