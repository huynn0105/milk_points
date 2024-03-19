import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_points/di/locator.dart';
import 'package:milk_points/presentation/bloc/customer_bloc/customer_bloc.dart';
import 'package:milk_points/presentation/bloc/customer_detail_cubit/customer_detail_cubit.dart';
import 'package:milk_points/presentation/routes/routes.dart';

import 'presentation/common/colors.dart';

int runAppMarker = 0;
void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    runAppMarker += 1;
    debugPrint("runAppMarker: $runAppMarker");
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> CustomerBloc()..add(CustomerGetDataEvent())),
        BlocProvider(create: (_)=> CustomerDetailCubit()),
      ],
      child: MaterialApp.router(
        title: 'Milk Points',
        debugShowCheckedModeBanner: false,
        routerConfig: locator<AppRouter>().config(),
        theme: Theme.of(context).copyWith(
          scaffoldBackgroundColor: UIColors.backgroundColor,
        ),
      ),
    );
  }
}
