// Content model for a portfolio project. Pure data — no Jaspr imports — so it
// stays trivially testable and reusable across server/client.

enum ProjectCategory {
  seerslab('시어스랩', 'Seerslab'),
  renasoftwareMobile('Renasoftware · Mobile', 'Renasoftware · Mobile'),
  renasoftwareDesktop('Renasoftware · Desktop', 'Renasoftware · Desktop'),
  personalCommissioned('개인·외주', 'Personal'),
  side('사이드', 'Side');

  const ProjectCategory(this.tabLabel, this.en);

  /// Label shown on the filter tab.
  final String tabLabel;

  /// English label.
  final String en;
}

class ProjectLink {
  final String label; // 'Play Store', 'App Store', 'GitHub', '관련 기사'
  final String url;

  const ProjectLink(this.label, this.url);
}

class Project {
  final String id;
  final String name;
  final ProjectCategory category;

  /// Per-project overline (e.g. 'Seerslab', 'Renasoftware · Mobile',
  /// '개인 · 출시'). Falls back to [category.tabLabel] when null.
  final String? org;
  final String period;
  final String oneLiner; // card summary (1~2 lines)
  final String description; // detail modal (3~6 lines)

  /// Short impact callout shown in the modal's IMPACT block.
  final String? impact;

  /// Role badge shown in the modal (e.g. '단독 개발', '앱+서버 단독').
  final String? role;

  final List<String> techStack;
  final List<String> highlights;
  final List<ProjectLink> links;
  final String? thumbnail; // assets/projects/{id}/thumb.webp
  final List<String> screenshots;

  const Project({
    required this.id,
    required this.name,
    required this.category,
    this.org,
    required this.period,
    required this.oneLiner,
    required this.description,
    this.impact,
    this.role,
    this.techStack = const [],
    this.highlights = const [],
    this.links = const [],
    this.thumbnail,
    this.screenshots = const [],
  });

  String get overline => org ?? category.tabLabel;

  /// First image to use as the card thumbnail (falls back to [thumbnail]).
  String? get cover => screenshots.isNotEmpty ? screenshots.first : thumbnail;
}
