import 'package:cartoon_app/core/strings.dart';
import 'package:cartoon_app/data/model/model.dart';
import 'package:cartoon_app/data/repository/repository.dart';
import 'package:cartoon_app/data/web_services/web_services.dart';
import 'package:cartoon_app/logic/cubit.dart';
import 'package:cartoon_app/presentation/screens/characters_details_screen.dart';
import 'package:cartoon_app/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  CharacterRepository? characterRepository;
  CartoonAppCubit? cartoonAppCubit;

  AppRouter() {
    characterRepository =
        CharacterRepository(characterWebService: CharacterWebService());
    cartoonAppCubit = CartoonAppCubit(characterRepository!);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CartoonAppCubit(characterRepository!),
            child: const CharactersScreen(),
          ),
        );

      case charactersDetailsScreenRoute:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharactersDetailsScreen(
            character: character,
          ),
        );
    }
    return null;
  }
}
