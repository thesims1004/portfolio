import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'components/header.dart';
import 'pages/home_page.dart';

/// Application root. The sticky [Header] sits above a [Router]; with static
/// multi-page rendering each [Route] is pre-rendered to its own HTML file.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      const Header(),
      Router(routes: [
        Route(
          path: '/',
          title: '심진웅 · Mobile App Developer',
          builder: (context, state) => const HomePage(),
        ),
      ]),
    ]);
  }
}
