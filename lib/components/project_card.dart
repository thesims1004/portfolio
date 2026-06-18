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
    final overflow = project.techStack.length - chips.length;

    return div(
      classes: 'pcard',
      attributes: {'role': 'button', 'tabindex': '0'},
      events: {'click': (_) => onOpen()},
      [
        div(classes: 'pcard-thumb', [
          if (project.thumbnail != null)
            img(src: project.thumbnail!, alt: project.name)
          else
            span(classes: 'thumb-name', [Component.text(project.name)]),
        ]),
        div(classes: 'pcard-body', [
          span(classes: 'overline', [Component.text(project.overline)]),
          h3(classes: 'pcard-title', [Component.text(project.name)]),
          p(classes: 'pcard-desc', [Component.text(project.oneLiner)]),
          div(classes: 'pcard-tech', [
            for (final t in chips) span(classes: 'chip', [Component.text(t)]),
            if (overflow > 0)
              span(classes: 'chip chip-more', [Component.text('+$overflow')]),
          ]),
          span(classes: 'pcard-period', [Component.text(project.period)]),
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
            radius: .circular(AppRadius.m.px),
            cursor: .pointer,
            overflow: .hidden,
            transition: Transition('all', duration: Duration(milliseconds: 160)),
          ),
          css('&:hover').styles(
            border: Border.all(color: AppColors.borderStrong, width: 1.px),
            raw: {
              'transform': 'translateY(-3px)',
              'box-shadow': '0 12px 28px rgba(20,24,31,0.08)',
            },
          ),
          css('.pcard-thumb', [
            css('&').styles(
              display: .flex,
              alignItems: .center,
              justifyContent: .center,
              backgroundColor: AppColors.surfaceSunken,
              border: Border.only(
                  bottom: BorderSide(color: AppColors.border, width: 1.px)),
              raw: {'aspect-ratio': '16 / 9'},
            ),
            css('.thumb-name').styles(
              padding: .symmetric(horizontal: AppSpacing.m.px),
              color: AppColors.textFaint,
              fontSize: AppType.small.rem,
              fontWeight: .w500,
              textAlign: .center,
            ),
            css('img').styles(
              width: 100.percent,
              height: 100.percent,
              raw: {'object-fit': 'cover', 'object-position': 'center 22%'},
            ),
          ]),
          css('.pcard-body').styles(
            display: .flex,
            flexDirection: .column,
            gap: Gap.all(AppSpacing.s.px),
            padding: .all(AppSpacing.l.px),
            height: 100.percent,
          ),
          css('.pcard-title').styles(
            color: AppColors.text,
            fontSize: AppType.lead.rem,
            fontWeight: .w700,
          ),
          css('.pcard-desc').styles(
            color: AppColors.textMuted,
            fontSize: AppType.small.rem,
            lineHeight: 1.6.em,
          ),
          css('.pcard-tech').styles(
            display: .flex,
            flexWrap: .wrap,
            gap: Gap.all(AppSpacing.xs.px),
            margin: .only(top: AppSpacing.xs.px),
          ),
          css('.chip-more').styles(color: AppColors.accent),
          css('.pcard-period').styles(
            margin: .only(top: AppSpacing.xs.px),
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            fontSize: AppType.micro.rem,
          ),
        ]),
      ];
}
