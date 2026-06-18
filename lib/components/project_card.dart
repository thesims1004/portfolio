import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/project.dart';
import '../design/tokens.dart';

/// A clickable project card. Tapping it opens the detail modal via [onOpen].
class ProjectCard extends StatelessComponent {
  const ProjectCard(this.project, {required this.onOpen, super.key});

  final Project project;
  final void Function() onOpen;

  static const _maxChips = 3;

  @override
  Component build(BuildContext context) {
    final chips = project.techStack.take(_maxChips).toList();

    return div(
      classes: 'pcard',
      attributes: {'role': 'button', 'tabindex': '0'},
      events: {'click': (_) => onOpen()},
      [
        // Fixed-ratio thumbnail: image is absolutely positioned and cover-fit,
        // so every card has the same height regardless of the image's ratio.
        div(classes: 'pcard-thumb', [
          if (project.cover != null)
            img(src: project.cover!, alt: project.name, attributes: {'loading': 'lazy'})
          else
            span(classes: 'thumb-name', [Component.text(project.name)]),
        ]),
        div(classes: 'pcard-body', [
          div(classes: 'pcard-cat', [Component.text(project.overline)]),
          div(classes: 'pcard-title', [Component.text(project.name)]),
          div(classes: 'pcard-desc', [Component.text(project.oneLiner)]),
          div(classes: 'pcard-tags', [
            for (final t in chips) span(classes: 'tag', [Component.text(t)]),
          ]),
          div(classes: 'pcard-period', [Component.text(project.period)]),
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
        css('.pcard', [
          css('&').styles(
            display: .flex,
            flexDirection: .column,
            backgroundColor: AppColors.white,
            border: Border.all(color: AppColors.border, width: 1.px),
            cursor: .pointer,
            overflow: .hidden,
            raw: {
              'border-radius': '9px',
              'box-shadow': '0 1px 2px rgba(16,24,40,0.05)',
              'transition':
                  'transform .18s ease, box-shadow .18s ease, border-color .18s ease',
            },
          ),
          css('&:hover').styles(
            border: Border.all(color: AppColors.blueChipBorder, width: 1.px),
            raw: {
              'transform': 'translateY(-3px)',
              'box-shadow': '0 12px 28px rgba(16,24,40,0.10)',
            },
          ),
          // Thumbnail (fixed 16:9).
          css('.pcard-thumb', [
            css('&').styles(
              position: .relative(),
              width: 100.percent,
              backgroundColor: AppColors.chipBg,
              overflow: .hidden,
              raw: {'aspect-ratio': '16 / 9'},
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
              fontSize: AppType.small.px,
              fontWeight: .w500,
              textAlign: .center,
              raw: {
                'transform': 'translate(-50%,-50%)',
                'padding': '0 16px',
                'width': '100%',
              },
            ),
          ]),
          // Body.
          css('.pcard-body').styles(
            display: .flex,
            flexDirection: .column,
            raw: {'padding': '18px', 'flex': '1'},
          ),
          css('.pcard-cat').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            raw: {
              'font-size': '11px',
              'letter-spacing': '0.03em',
              'margin-bottom': '8px',
            },
          ),
          css('.pcard-title').styles(
            color: AppColors.text,
            fontWeight: .w700,
            raw: {
              'font-size': '17px',
              'letter-spacing': '-0.01em',
              'margin-bottom': '6px',
            },
          ),
          css('.pcard-desc').styles(
            color: AppColors.textMuted,
            raw: {
              'font-size': '14px',
              'line-height': '1.55',
              'margin-bottom': '16px',
              'flex': '1',
            },
          ),
          css('.pcard-tags').styles(
            display: .flex,
            flexWrap: .wrap,
            gap: Gap.all(6.px),
            raw: {'margin-bottom': '14px'},
          ),
          css('.pcard-tags .tag').styles(
            color: AppColors.chipTextMuted,
            backgroundColor: AppColors.chipBg,
            fontFamily: AppFonts.mono,
            raw: {'font-size': '11px', 'border-radius': '4px', 'padding': '4px 9px'},
          ),
          css('.pcard-period').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            raw: {'font-size': '12px'},
          ),
        ]),
      ];
}
