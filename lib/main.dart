import 'dart:async';
import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/router/router.dart';
import 'package:pomodore/di.dart';
import 'package:pomodore/features/configuration/presentation/blocs/base_bloc/base_bloc.dart';
import 'package:pomodore/features/configuration/presentation/blocs/settings_bloc/settings_bloc.dart';
import 'package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart';

import 'core/observers/bloc_observer.dart';
import 'core/utils/responsive/size_config.dart';
import 'features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
      .copyWith(statusBarIconBrightness: Brightness.dark));

  // Dependency injection
  await inject();

  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        // provide all global blocs
        BlocProvider<TimerBloc>(create: (context) => getIt.get<TimerBloc>()),
        BlocProvider<BaseBloc>(create: (context) => getIt.get<BaseBloc>()),
        BlocProvider<SettingsBloc>(
            create: (context) =>
            getIt.get<SettingsBloc>()
              ..add(InitDataFetched())),
      ],
      child: const MyApp(),
    ),
  );

  // some setting to config Desktop version
  if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    doWhenWindowReady(() {
      const initialSize = Size(400, 700);
      appWindow.minSize = initialSize;
      appWindow.maxSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.centerRight;
      appWindow.title = AppConstant.appName;
      appWindow.show();
    });
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late Locale locale;
  late ThemeData themeData;

  @override
  void initState() {
    super.initState();
    print("initState");
    restoreTimerState();
    WidgetsBinding.instance.addObserver(this);
    locale = const Locale("en");
    themeData = AppConstant.defaultLightTheme;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        saveTimerState();
        break;
      default:
        break;
    }
  }

  void saveTimerState() {
    context.read<TimerBloc>().add(const TimerStateSaved());
  }

  void restoreTimerState() {
    context.read<TimerBloc>().add(const TimerStateRestored());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TimerBloc, TimerState>(
          listener: (context, state) {
            TimerBloc bloc = context.read<TimerBloc>();
            if (state is RestoreTimerSuccess) {
              if (state.timerStateParams.timerDone) {
                bloc.add(
                  CurrentPomodoroToDatabaseSaved(
                    PomodoroEntity(
                      duration: TimerBloc.getDuration,
                      dateTime: DateTime.now().toString(),
                    ),
                  ),
                );
              } else {
                bloc..add(TimerTaskSelected(state.timerStateParams.task))..add(
                    TimerDurationSet(state.timerStateParams.baseDuration))..add(
                    TimerStarted(state.timerStateParams.duration));
              }
            }

            if (state is TimerCompleted) {
              bloc.add(
                CurrentPomodoroToDatabaseSaved(
                  PomodoroEntity(
                    duration: TimerBloc.getDuration,
                    dateTime: DateTime.now().toString(),
                  ),
                ),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return OrientationBuilder(
            builder: (context, orientation) {
              if (state is InitDataFetchSuccess) {
                locale = state.locale;
                themeData = state.themeData;
              }

              if (state is ChangeLanguageSuccess) {
                locale = state.locale;
              }

              if (state is ChangeThemeSuccess) {
                themeData = state.themeData;
              }

              return LayoutBuilder(builder: (context, constraints) {
                SizeConfig().init(constraints, orientation);
                return MaterialApp(
                  title: AppConstant.appName,
                  onGenerateRoute: AppRouter.onGenerationRouter,
                  theme: themeData,
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en'),
                    Locale('fa'),
                    Locale('de'),
                  ],
                  locale: locale,
                );
              });
            },
          );
        },
      ),
    );
  }
}
