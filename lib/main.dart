import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:dartupify/app_router.dart';
import 'package:dartupify/domain/repositories/music_library_repository.dart';
import 'package:dartupify/domain/services/music_library_service.dart';
import 'package:dartupify/pages/main/main_page.dart';
import 'package:dartupify/pages/music_library/bloc/index.dart';
import 'package:dartupify/pages/playlist/cubit/index.dart';
import 'package:dartupify/theme.dart';
import 'package:dartupify/widgets/platform/factory/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(App());
}

class App extends StatelessWidget {
  IPlatformWidgetsFactory _createPlatformWidgetsFactory() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return MaterialWidgetsFactory();
      case TargetPlatform.iOS:
        return CupertinoWidgetsFactory();
      default:
        return MaterialWidgetsFactory();
    }
  }

  @override
  Widget build(BuildContext context) {
    var widgetsFactory = _createPlatformWidgetsFactory();

    return MultiBlocProvider(
      providers: [
        BlocProvider<MusicLibraryBloc>(
          create: (_) => MusicLibraryBloc(
            musicLibraryService: MusicLibraryService(
              repository: MusicLibraryRepository(),
            ),
          )..add(MusicLibraryLoadStarted()),
        ),
        BlocProvider<PlaylistCubit>(
          create: (_) => PlaylistCubit(),
        )
      ],
      child: Provider<IPlatformWidgetsFactory>.value(
        value: widgetsFactory,
        child: MaterialApp(
          title: 'DartUPify',
          theme: theme,
          onGenerateRoute: (settings) => AppRouter.generateRoute(
            settings,
            widgetsFactory,
          ),
          initialRoute: MainPage.route,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
