import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_bloc/app/cubit/list_cubit.dart';
import 'package:teste_bloc/app/view/start_page.dart';

import 'package:teste_bloc/app/view/splash_page.dart';
import 'app/app_import.dart';
import 'shared/repository/repository.dart';

class App extends StatelessWidget {
/*   App()
      : super(
          theme: ThemeData(
              backgroundColor: Colors.blue,
              primarySwatch: Colors.blue,
              fontFamily: 'Google'),
          debugShowCheckedModeBanner: false,
          home: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => ListCubit(repository: Repository())..fetchList(),
                child: StartPage(),
              ),
              BlocProvider(
                create: (_) => ListCubit(repository: Repository())..fetchList(),
                child: ListPage(),
              ),
              BlocProvider(
                create: (_) => ListCubit(repository: Repository())..fetchList(),
                child: CpfPage(),
              ),
              BlocProvider(
                create: (_) => ListCubit(repository: Repository())..fetchList(),
                child: DataNascimentoPage(),
              ),
              BlocProvider(
                create: (_) => ListCubit(repository: Repository())..fetchList(),
                child: NomeMaePage(),
              ),
              BlocProvider(
                create: (_) => ListCubit(repository: Repository())..fetchList(),
                child: GeneroPage(),
              ),
              BlocProvider(
                create: (_) => ListCubit(repository: Repository())..fetchList(),
                child: ConfirmarDadosPage(),
              )
            ],
            child: StartPage(),
          ),
        ); */
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: App(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: SplashPage(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: StartPage(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: ListPage(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: CpfPage(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: DataNascimentoPage(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: NomeMaePage(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: GeneroPage(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: ConfirmarDadosPage(),
          lazy: false,
        )
      ],
      child: MaterialApp(
          color: Colors.red,
          theme: ThemeData(
              backgroundColor: Colors.blue,
              primarySwatch: Colors.blue,
              fontFamily: 'Google'),
          debugShowCheckedModeBanner: false,
          home: SplashPage()),
    );
  }
}
