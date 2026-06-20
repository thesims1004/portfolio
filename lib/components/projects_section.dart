import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/project.dart';
import '../data/projects_data.dart';
import '../design/tokens.dart';
import 'project_card.dart';
import 'project_modal.dart';
import 'project_row.dart';

/// SVG `<rect>` shorthand for the toggle icons.
Component _rect(String x, String y, String w, String h, String rx) =>
    Component.element(tag: 'rect', attributes: {
      'x': x,
      'y': y,
      'width': w,
      'height': h,
      'rx': rx,
      'fill': 'currentColor',
    }, children: const []);

Component _listIcon() => svg(viewBox: '0 0 16 16', [
      _rect('1.5', '2.5', '3', '3', '0.8'),
      _rect('1.5', '6.5', '3', '3', '0.8'),
      _rect('1.5', '10.5', '3', '3', '0.8'),
      _rect('6.5', '3', '8', '2', '1'),
      _rect('6.5', '7', '8', '2', '1'),
      _rect('6.5', '11', '8', '2', '1'),
    ], width: 14.px, height: 14.px);

Component _cardIcon() => svg(viewBox: '0 0 16 16', [
      _rect('1.5', '1.5', '5.5', '5.5', '1'),
      _rect('9', '1.5', '5.5', '5.5', '1'),
      _rect('1.5', '9', '5.5', '5.5', '1'),
      _rect('9', '9', '5.5', '5.5', '1'),
    ], width: 14.px, height: 14.px);

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
          // Controls row: filter tabs (left) + view toggle (right).
          css('.controls').styles(
            display: .flex,
            alignItems: .end,
            justifyContent: .spaceBetween,
            flexWrap: .wrap,
            gap: Gap.all(AppSpacing.m.px),
            border: Border.only(
                bottom: BorderSide(color: AppColors.border, width: 1.px)),
            raw: {'margin-bottom': '28px', 'padding-bottom': '2px'},
          ),
          css('.filter-tabs').styles(
            display: .flex,
            flexWrap: .wrap,
            gap: Gap.all(6.px),
          ),
          // Segmented view toggle.
          css('.view-toggle').styles(
            display: .inlineFlex,
            gap: Gap.all(2.px),
            backgroundColor: AppColors.chipBg,
            border: Border.all(color: AppColors.border, width: 1.px),
            raw: {
              'padding': '3px',
              'border-radius': '8px',
              'margin-bottom': '8px',
              'flex': '0 0 auto',
            },
          ),
          css('.seg', [
            css('&').styles(
              display: .inlineFlex,
              alignItems: .center,
              gap: Gap.all(6.px),
              color: AppColors.textFaint,
              backgroundColor: Colors.transparent,
              cursor: .pointer,
              fontFamily: AppFonts.sans,
              fontWeight: .w600,
              raw: {
                'appearance': 'none',
                '-webkit-appearance': 'none',
                'border': 'none',
                'font-size': '13px',
                'border-radius': '6px',
                'padding': '6px 12px',
                'letter-spacing': '-0.01em',
                'transition': 'background .15s, color .15s',
              },
            ),
            css('svg').styles(raw: {'display': 'block'}),
          ]),
          css('.seg.on').styles(
            color: AppColors.primary,
            backgroundColor: AppColors.white,
            raw: {'box-shadow': '0 1px 2px rgba(16,24,40,0.08)'},
          ),
          css('.filter-tab', [
            css('&').styles(
              display: .inlineFlex,
              alignItems: .center,
              gap: Gap.all(7.px),
              color: AppColors.textMuted,
              backgroundColor: Colors.transparent,
              cursor: .pointer,
              fontFamily: AppFonts.sans,
              fontWeight: .w500,
              raw: {
                // Full reset of the native <button> chrome, then add an
                // underline via border-bottom only (design parity).
                'appearance': 'none',
                '-webkit-appearance': 'none',
                'border': 'none',
                'border-bottom': '2px solid transparent',
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
              raw: {'border-bottom': '2px solid #2E5A8C'},
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
  bool _listView = true; // default: list view

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
          Component.text('총 ${projects.length}건 · 항목을 누르면 상세를 볼 수 있습니다.'),
        ]),
        div(classes: 'controls', [
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
          div(classes: 'view-toggle', [
            button(
              classes: 'seg${_listView ? ' on' : ''}',
              attributes: {'title': '리스트 보기', 'aria-label': '리스트 보기'},
              events: {'click': (_) => setState(() => _listView = true)},
              [_listIcon(), Component.text('리스트')],
            ),
            button(
              classes: 'seg${!_listView ? ' on' : ''}',
              attributes: {'title': '카드 보기', 'aria-label': '카드 보기'},
              events: {'click': (_) => setState(() => _listView = false)},
              [_cardIcon(), Component.text('카드')],
            ),
          ]),
        ]),
        if (_listView)
          div(classes: 'project-list', [
            for (final proj in _visible)
              ProjectRow(proj, onOpen: () => setState(() => _open = proj)),
          ])
        else
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
