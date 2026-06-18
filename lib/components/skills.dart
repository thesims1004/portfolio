import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/profile.dart';
import '../design/tokens.dart';

/// Skills section: a strengths intro (chips absorbed from the removed About
/// section) followed by four skill-group cards.
class Skills extends StatelessComponent {
  const Skills({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'skills', classes: 'section skills', [
      div(classes: 'inner', [
        span(classes: 'overline', [Component.text('Skills')]),
        h2(classes: 'section-title', [Component.text('주요 강점 & 기술 스택')]),
        div(classes: 'strengths', [
          for (final s in Profile.strengths)
            span(classes: 'strength', [Component.text(s)]),
        ]),
        div(classes: 'skill-grid', [
          for (final g in Profile.skillGroups)
            div(classes: 'skill-card', [
              div(classes: 'skill-title', [Component.text(g.title)]),
              div(classes: 'skill-sub', [Component.text(g.subtitle)]),
              div(classes: 'skill-items', [
                for (final i in g.items)
                  span(classes: 'skill-chip', [Component.text(i)]),
              ]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.skills', [
          css('&').styles(
            backgroundColor: AppColors.surface,
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
              'margin': '0 0 20px',
            },
          ),
          css('.strengths').styles(
            display: .flex,
            flexWrap: .wrap,
            gap: Gap.all(AppSpacing.s.px),
            raw: {'margin-bottom': '40px'},
          ),
          css('.strength').styles(
            color: AppColors.primary,
            backgroundColor: AppColors.white,
            border: Border.all(color: AppColors.blueChipBorder, width: 1.px),
            fontSize: AppType.tiny.px,
            fontWeight: .w500,
            raw: {'border-radius': '6px', 'padding': '7px 13px'},
          ),
          css('.skill-grid').styles(
            display: .grid,
            gap: Gap.all(AppSpacing.m.px),
            raw: {'grid-template-columns': 'repeat(auto-fit,minmax(250px,1fr))'},
          ),
          css('.skill-card', [
            css('&').styles(
              backgroundColor: AppColors.white,
              border: Border.all(color: AppColors.border, width: 1.px),
              raw: {'border-radius': '10px', 'padding': '24px'},
            ),
            css('.skill-title').styles(
              color: AppColors.text,
              fontWeight: .w700,
              raw: {
                'font-size': '16px',
                'letter-spacing': '-0.01em',
                'margin-bottom': '4px',
              },
            ),
            css('.skill-sub').styles(
              color: AppColors.textFaint,
              fontFamily: AppFonts.mono,
              raw: {'font-size': '11px', 'margin-bottom': '16px'},
            ),
            css('.skill-items').styles(
                display: .flex, flexWrap: .wrap, gap: Gap.all(AppSpacing.s.px)),
            css('.skill-chip').styles(
              color: AppColors.text,
              backgroundColor: AppColors.chipBg,
              fontSize: AppType.tiny.px,
              raw: {'border-radius': '6px', 'padding': '6px 11px'},
            ),
          ]),
        ]),
      ];
}
