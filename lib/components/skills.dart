import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/profile.dart';
import '../design/tokens.dart';

/// Skills section: a short "strengths" intro (chips absorbed from the removed
/// About section) followed by four skill-group cards.
class Skills extends StatelessComponent {
  const Skills({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'skills', classes: 'section skills', [
      div(classes: 'container', [
        span(classes: 'overline', [Component.text('Skills')]),
        h2(classes: 'section-title', [Component.text('주요 강점 & 기술 스택')]),
        div(classes: 'strengths', [
          for (final s in Profile.strengths)
            span(classes: 'strength', [Component.text(s)]),
        ]),
        div(classes: 'skill-grid', [
          for (final g in Profile.skillGroups)
            div(classes: 'skill-card', [
              div(classes: 'skill-head', [
                span(classes: 'skill-title', [Component.text(g.title)]),
                span(classes: 'skill-sub', [Component.text(g.subtitle)]),
              ]),
              div(classes: 'skill-items', [
                for (final i in g.items)
                  span(classes: 'chip', [Component.text(i)]),
              ]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.skills', [
          css('.section-title').styles(
            margin: .only(top: AppSpacing.s.px),
            color: AppColors.text,
            fontSize: AppType.h2.rem,
            fontWeight: .w800,
          ),
          css('.strengths').styles(
            display: .flex,
            flexWrap: .wrap,
            gap: Gap.all(AppSpacing.s.px),
            margin: .symmetric(vertical: AppSpacing.l.px),
          ),
          css('.strength', [
            css('&').styles(
              padding: .symmetric(horizontal: 14.px, vertical: 7.px),
              color: AppColors.primary,
              backgroundColor: AppColors.primarySoft,
              border: Border.all(color: AppColors.impactBorder, width: 1.px),
              radius: .circular(AppRadius.full.px),
              fontSize: AppType.small.rem,
              fontWeight: .w600,
            ),
          ]),
          css('.skill-grid').styles(
            display: .grid,
            gap: Gap.all(AppSpacing.m.px),
            margin: .only(top: AppSpacing.s.px),
            raw: {'grid-template-columns': 'repeat(auto-fit, minmax(240px, 1fr))'},
          ),
          css('.skill-card', [
            css('&').styles(
              padding: .all(AppSpacing.l.px),
              backgroundColor: AppColors.white,
              border: Border.all(color: AppColors.border, width: 1.px),
              radius: .circular(AppRadius.m.px),
            ),
            css('.skill-head').styles(
              display: .flex,
              alignItems: .baseline,
              gap: Gap.all(AppSpacing.s.px),
              margin: .only(bottom: AppSpacing.m.px),
            ),
            css('.skill-title').styles(
              color: AppColors.text,
              fontSize: AppType.lead.rem,
              fontWeight: .w700,
              fontFamily: AppFonts.en,
            ),
            css('.skill-sub').styles(
              color: AppColors.textFaint,
              fontFamily: AppFonts.mono,
              fontSize: AppType.micro.rem,
              letterSpacing: 0.5.px,
            ),
            css('.skill-items').styles(
              display: .flex,
              flexWrap: .wrap,
              gap: Gap.all(AppSpacing.s.px),
            ),
          ]),
        ]),
        // Shared neutral chip (skills + project cards + modal).
        css('.chip').styles(
          padding: .symmetric(horizontal: 10.px, vertical: 5.px),
          color: AppColors.chipText,
          backgroundColor: AppColors.chipBg,
          radius: .circular(AppRadius.xs.px),
          fontSize: AppType.tiny.rem,
          fontFamily: AppFonts.en,
        ),
      ];
}
