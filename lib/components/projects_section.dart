import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/project.dart';
import '../data/projects_data.dart';
import '../design/tokens.dart';
import 'project_card.dart';
import 'project_modal.dart';

/// Interactive projects section: category filter tabs with live counts, a
/// responsive card grid, and a click-through detail modal.
///
/// `@client` — this island hydrates on the client so filtering and the modal
/// work; it still server-renders (default: all projects, no modal) for SEO.
///
/// Styles live on this public class (jaspr's `@css` may not be applied to the
/// private State class).
@client
class ProjectsSection extends StatefulComponent {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();

  @css
  static List<StyleRule> get styles => [
        css('.projects', [
          css('&').styles(backgroundColor: AppColors.surface),
          css('.section-title').styles(
            margin: .only(top: AppSpacing.s.px),
            color: AppColors.text,
            fontSize: AppType.h2.rem,
            fontWeight: .w800,
          ),
          css('.section-lead').styles(
            margin: .only(top: AppSpacing.s.px),
            color: AppColors.textMuted,
            fontSize: AppType.small.rem,
          ),
          css('.filter-tabs').styles(
            display: .flex,
            flexWrap: .wrap,
            gap: Gap.all(AppSpacing.l.px),
            margin: .symmetric(vertical: AppSpacing.l.px),
            border: Border.only(
                bottom: BorderSide(color: AppColors.border, width: 1.px)),
          ),
          css('.filter-tab', [
            css('&').styles(
              display: .inlineFlex,
              alignItems: .center,
              gap: Gap.all(AppSpacing.s.px),
              padding: .only(bottom: 12.px),
              color: AppColors.textMuted,
              backgroundColor: Colors.transparent,
              border: Border.only(
                  bottom: BorderSide(color: Colors.transparent, width: 2.px)),
              cursor: .pointer,
              fontSize: AppType.small.rem,
              fontWeight: .w600,
              raw: {'margin-bottom': '-1px'},
            ),
            css('&:hover').styles(color: AppColors.text),
            css('.tab-count').styles(
              color: AppColors.textFaint,
              fontFamily: AppFonts.mono,
              fontSize: AppType.micro.rem,
            ),
          ]),
          css('.filter-tab.active', [
            css('&').styles(
              color: AppColors.primary,
              border: Border.only(
                  bottom: BorderSide(color: AppColors.primary, width: 2.px)),
            ),
            css('.tab-count').styles(color: AppColors.primary),
          ]),
          css('.projects-grid').styles(
            display: .grid,
            gap: Gap.all(AppSpacing.l.px),
            raw: {'grid-template-columns': 'repeat(auto-fill, minmax(290px, 1fr))'},
          ),
        ]),
      ];
}

class _ProjectsSectionState extends State<ProjectsSection> {
  ProjectCategory? _filter; // null = 전체
  Project? _open;

  int _count(ProjectCategory? c) => c == null
      ? projects.length
      : projects.where((proj) => proj.category == c).length;

  List<Project> get _visible => _filter == null
      ? projects
      : projects.where((proj) => proj.category == _filter).toList();

  @override
  Component build(BuildContext context) {
    final tabs = <ProjectCategory?>[null, ...ProjectCategory.values];

    return section(id: 'projects', classes: 'section projects', [
      div(classes: 'container', [
        span(classes: 'overline', [Component.text('Projects')]),
        h2(classes: 'section-title', [Component.text('프로젝트')]),
        p(classes: 'section-lead', [
          Component.text('총 ${projects.length}건 · 카드를 누르면 상세를 볼 수 있습니다.'),
        ]),
        div(classes: 'filter-tabs', [
          for (final c in tabs)
            button(
              classes: 'filter-tab${c == _filter ? ' active' : ''}',
              events: {'click': (_) => setState(() => _filter = c)},
              [
                Component.text(c == null ? '전체' : c.tabLabel),
                span(classes: 'tab-count', [Component.text('${_count(c)}')]),
              ],
            ),
        ]),
        div(classes: 'projects-grid', [
          for (final proj in _visible)
            ProjectCard(proj, onOpen: () => setState(() => _open = proj)),
        ]),
      ]),
      if (_open != null)
        ProjectModal(_open!, onClose: () => setState(() => _open = null)),
    ]);
  }
}
