import 'package:auto_route/auto_route.dart';
import 'package:flutter_sample_bloc_pattern/presentation/widgets/screens.dart';

export 'package:auto_route/auto_route.dart';
export 'routes.gr.dart';

@CustomAutoRouter(
  transitionsBuilder: TransitionsBuilders.slideRightWithFade,
  durationInMilliseconds: 200,
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(path: '/userDetailScreen', page: UserDetailsScreen),
   /* AutoRoute(path: '/notes', page: HomeScreen),
    AutoRoute(path: '/notes/:noteId', page: NoteDetailScreen),
    AutoRoute(path: 'add-update-note', page: AddUpdateNoteScreen),*/
  ],
)
class $AppRouter {}