import 'package:jaspr/jaspr.dart';

import '../components/footer.dart';
import '../components/hero.dart';
import '../components/projects_section.dart';
import '../components/skills.dart';

/// The single-page home route: Hero + Highlights → Skills → Projects → Contact.
///
/// Per the design revision the About section was removed (its intro lives in the
/// Hero, its strength chips in Skills). Only [ProjectsSection] is a client
/// island; everything else is static for first paint and SEO.
class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      const Hero(),
      const Skills(),
      const ProjectsSection(),
      const Footer(),
    ]);
  }
}
