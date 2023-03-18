import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profiledevtest/feature/home/cubit/profile_cubit.dart';
import 'package:profiledevtest/config/injection_api.dart' as di;
import 'package:profiledevtest/utils/dimension.dart';
import 'feature/home/presentation/pages/home_contact_page.dart';


void main() async {

  runApp(const MyApp());
  await di.init();

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (_) => di.sl<ProfileCubit>()..getAllUsers(),
        ),

      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeContactPage(),
      ),

    );

  }
}
