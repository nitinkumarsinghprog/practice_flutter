import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_flutter/cubit/product_cubit/product_cubit.dart';
import 'package:practice_flutter/cubit/recipes_cubit/recipes_cubit.dart';
import 'package:practice_flutter/cubit/user_cubit/user_cubit.dart';
import 'package:practice_flutter/pages/components/product_page.dart';
import 'package:practice_flutter/pages/recipes_page.dart';
import 'package:practice_flutter/pages/user_page.dart';
import 'package:practice_flutter/repositories/product/product_repository.dart';
import 'package:practice_flutter/repositories/recipes/recipes_repository.dart';
import 'package:practice_flutter/repositories/user/user_repository.dart';
import 'package:practice_flutter/services/api_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) =>
                            UserCubit(UserRepository(ApiService())),
                        child: const UserPage(),
                      ),
                    ),
                  );
                },
                child: const Text("Click to go on the User Screen"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) =>
                            RecipesCubit(RecipesRepository(ApiService())),
                        child: const RecipesPage(),
                      ),
                    ),
                  );
                },
                child: const Text("Click to go on the Recipes Screen"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) =>
                            ProductCubit(ProductRepository(ApiService())),
                        child: ProductPage(),
                      ),
                    ),
                  );
                },
                child: const Text("Click to go on the comments Screen"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
