// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:portfolio/components/footer.dart' as _footer;
import 'package:portfolio/components/header.dart' as _header;
import 'package:portfolio/components/hero.dart' as _hero;
import 'package:portfolio/components/project_card.dart' as _project_card;
import 'package:portfolio/components/project_modal.dart' as _project_modal;
import 'package:portfolio/components/projects_section.dart'
    as _projects_section;
import 'package:portfolio/components/skills.dart' as _skills;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _projects_section.ProjectsSection:
        ClientTarget<_projects_section.ProjectsSection>('projects_section'),
  },
  styles: () => [
    ..._footer.Footer.styles,
    ..._header.Header.styles,
    ..._hero.Hero.styles,
    ..._project_card.ProjectCard.styles,
    ..._project_modal.ProjectModal.styles,
    ..._projects_section.ProjectsSection.styles,
    ..._skills.Skills.styles,
  ],
);
