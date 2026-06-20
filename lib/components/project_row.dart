import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/project.dart';
import '../design/tokens.dart';

/// A single project row for the list view. Tapping it opens the detail modal.
class ProjectRow extends StatelessComponent {
  const ProjectRow(this.project, {required this.onOpen, super.key});

  final Project project;
  final void Function() onOpen;

  static const _maxChips = 3;

  @override
  Component build(BuildContext context) {
    final chips = project.techStack.take(_maxChips).toList();

    return div(
      classes: 'prow',
      attributes: {'role': 'button', 'tabindex': '0'},
      events: {'click': (_) => onOpen()},
      [
        div(classes: 'prow-thumb', [
          if (project.cover != null)
            img(src: project.cover!, alt: project.name, attributes: {'loading': 'lazy'})
          else
            span(classes: 'thumb-name', [Component.text(project.name)]),
        ]),
        div(classes: 'prow-main', [
          div(classes: 'prow-head', [
            span(classes: 'prow-title', [Component.text(project.name)]),
            span(classes: 'prow-cat', [Component.text(project.overline)]),
          ]),
          div(classes: 'prow-oneliner', [Component.text(project.oneLiner)]),
        ]),
        div(classes: 'prow-tags', [
          for (final t in chips) span(classes: 'tag', [Component.text(t)]),
        ]),
        div(classes: 'prow-period', [Component.text(project.period)]),
        div(classes: 'prow-arrow', [Component.text('→')]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
        css('.project-list').styles(
          backgroundColor: AppColors.white,
          border: Border.all(color: AppColors.border, width: 1.px),
          overflow: .hidden,
          raw: {'border-radius': '10px'},
        ),
        css('.prow', [
          css('&').styles(
            display: .flex,
            alignItems: .center,
            gap: Gap.all(AppSpacing.m.px),
            cursor: .pointer,
            border: Border.only(
                bottom: BorderSide(color: AppColors.borderFaint, width: 1.px)),
            raw: {'padding': '14px 18px', 'transition': 'background .14s ease'},
          ),
          css('&:hover').styles(backgroundColor: const Color('#F7F9FB')),
          css('&:last-child').styles(
              border: Border.only(
                  bottom: BorderSide(color: Colors.transparent, width: 1.px))),
          // Thumbnail.
          css('.prow-thumb', [
            css('&').styles(
              position: .relative(),
              width: 96.px,
              height: 60.px,
              backgroundColor: AppColors.chipBg,
              overflow: .hidden,
              raw: {'border-radius': '6px', 'flex': '0 0 auto'},
            ),
            css('img').styles(
              position: .absolute(
                  top: Unit.zero, left: Unit.zero, right: Unit.zero, bottom: Unit.zero),
              width: 100.percent,
              height: 100.percent,
              raw: {'object-fit': 'cover', 'object-position': 'center top'},
            ),
            css('.thumb-name').styles(
              position: .absolute(top: 50.percent, left: 50.percent),
              color: AppColors.textFaint,
              raw: {
                'font-size': '10px',
                'transform': 'translate(-50%,-50%)',
                'text-align': 'center',
                'width': '90%',
              },
            ),
          ]),
          // Main (title + one-liner).
          css('.prow-main').styles(raw: {'flex': '1 1 240px', 'min-width': '0'}),
          css('.prow-head').styles(
            display: .flex,
            alignItems: .baseline,
            flexWrap: .wrap,
            gap: Gap.all(10.px),
            raw: {'margin-bottom': '3px'},
          ),
          css('.prow-title').styles(
            color: AppColors.text,
            fontWeight: .w700,
            raw: {'font-size': '16px', 'letter-spacing': '-0.01em'},
          ),
          css('.prow-cat').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            raw: {'font-size': '11px', 'letter-spacing': '0.03em'},
          ),
          css('.prow-oneliner').styles(
            color: AppColors.textMuted,
            raw: {
              'font-size': '13.5px',
              'line-height': '1.5',
              'overflow': 'hidden',
              'text-overflow': 'ellipsis',
              'white-space': 'nowrap',
            },
          ),
          // Tags.
          css('.prow-tags', [
            css('&').styles(
              display: .flex,
              flexWrap: .wrap,
              gap: Gap.all(6.px),
              justifyContent: .end,
              raw: {'flex': '0 1 auto'},
            ),
            css('.tag').styles(
              color: AppColors.chipTextMuted,
              backgroundColor: AppColors.chipBg,
              fontFamily: AppFonts.mono,
              raw: {
                'font-size': '11px',
                'border-radius': '4px',
                'padding': '4px 9px',
                'white-space': 'nowrap',
              },
            ),
          ]),
          css('.prow-period').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            textAlign: .end,
            raw: {'font-size': '12px', 'flex': '0 0 auto', 'min-width': '92px'},
          ),
          css('.prow-arrow').styles(
            color: AppColors.borderStrongHover,
            raw: {'font-size': '16px', 'flex': '0 0 auto'},
          ),
        ]),
        // Collapse the secondary columns on small screens.
        css.media(MediaQuery.all(maxWidth: 640.px), [
          css('.prow .prow-tags').styles(display: .none),
          css('.prow .prow-period').styles(display: .none),
        ]),
      ];
}
