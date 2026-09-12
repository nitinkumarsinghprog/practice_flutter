import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_flutter/cubit/user_cubit/cubit/user_cubit.dart';
import 'package:practice_flutter/pages/user_page.dart';
import 'package:practice_flutter/repositories/user/user_repository.dart';
import 'package:practice_flutter/services/api_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ElevatedButton(
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
        ),
      ],
    );
  }
}
