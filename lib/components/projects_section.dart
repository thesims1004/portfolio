import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/project.dart';
import '../data/projects_data.dart';
import '../design/tokens.dart';
import 'project_card.dart';
import 'project_modal.dart';

/// Interactive projects section: category filter tabs with live counts, a
/// responsive card grid, and a click-through detail modal. `@client` so it
/// hydrates for filtering/modal; server-renders all cards for SEO.
@client
class ProjectsSection extends StatefulComponent {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();

  @css
  static List<StyleRule> get styles => [
        css('.projects', [
          css('&').styles(
            border: Border.only(
                bottom: BorderSide(color: AppColors.borderSoft, width: 1.px)),
          ),
          css('.inner').styles(
            width: 100.percent,
            maxWidth: AppLayout.maxWidth.px,
            margin: .symmetric(horizontal: Unit.auto),
          ),
          css('.section-title').styles(
            color: AppColors.text,
            fontWeight: .w700,
            raw: {
              'font-size': 'clamp(24px,3.2vw,30px)',
              'line-height': '1.3',
              'letter-spacing': '-0.02em',
              'margin': '0 0 8px',
            },
          ),
          css('.section-lead').styles(
            color: AppColors.textMuted,
            raw: {'font-size': '15px', 'margin': '0 0 32px'},
          ),
          // Filter tabs.
          css('.filter-tabs').styles(
            display: .flex,
            flexWrap: .wrap,
            gap: Gap.all(6.px),
            border: Border.only(
                bottom: BorderSide(color: AppColors.border, width: 1.px)),
            raw: {'margin-bottom': '32px', 'padding-bottom': '2px'},
          ),
          css('.filter-tab', [
            css('&').styles(
              display: .inlineFlex,
              alignItems: .center,
              gap: Gap.all(7.px),
              color: AppColors.textMuted,
              backgroundColor: Colors.transparent,
              border: Border.only(
                  bottom: BorderSide(color: Colors.transparent, width: 2.px)),
              cursor: .pointer,
              fontFamily: AppFonts.sans,
              fontWeight: .w500,
              raw: {
                'font-size': '14px',
                'padding': '10px 14px',
                'margin-bottom': '-2px',
                'white-space': 'nowrap',
                'transition': 'color .15s',
              },
            ),
            css('&:hover').styles(color: AppColors.text),
            css('.tab-count').styles(
              color: AppColors.textFaint,
              backgroundColor: AppColors.chipBg,
              fontFamily: AppFonts.mono,
              fontWeight: .w500,
              raw: {'font-size': '11px', 'border-radius': '5px', 'padding': '1px 6px'},
            ),
          ]),
          css('.filter-tab.active', [
            css('&').styles(
              color: AppColors.primary,
              fontWeight: .w600,
              border: Border.only(
                  bottom: BorderSide(color: AppColors.primary, width: 2.px)),
            ),
            css('.tab-count').styles(
                color: AppColors.primary, backgroundColor: AppColors.countBg),
          ]),
          css('.projects-grid').styles(
            display: .grid,
            gap: Gap.all(18.px),
            raw: {'grid-template-columns': 'repeat(auto-fill,minmax(300px,1fr))'},
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
      div(classes: 'inner', [
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
