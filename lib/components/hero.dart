import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/profile.dart';
import '../design/tokens.dart';

/// Landing hero rendered as a résumé-style profile card (photo + identity +
/// intro + education + contact + CTAs), followed by a lower-hierarchy
/// Highlights band of four stat cards.
class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      section(id: 'top', classes: 'hero', [
        div(classes: 'container hero-grid', [
          // Profile photo (or placeholder slot when no photo is set).
          div(classes: 'hero-photo', [
            if (Profile.photo != null)
              img(classes: 'photo-img', src: Profile.photo!, alt: Profile.name)
            else
              div(classes: 'photo-slot', [
                span(classes: 'photo-ico', [Component.text('◍')]),
                span(classes: 'photo-cap', [Component.text('프로필 사진')]),
              ]),
          ]),
          // Identity + intro + contact.
          div(classes: 'hero-main', [
            span(classes: 'open-badge', [
              span(classes: 'dot', []),
              Component.text(Profile.badge),
            ]),
            h1(classes: 'hero-name', [
              Component.text(Profile.name),
              span(classes: 'hero-name-en', [Component.text(Profile.nameEn)]),
            ]),
            p(classes: 'hero-title', [
              span(classes: 'title-strong', [Component.text('앱 개발자')]),
              Component.text(' · Mobile · Desktop · AI 스마트 글래스'),
            ]),
            p(classes: 'hero-intro', [Component.text(Profile.intro)]),
            div(classes: 'hero-edu', [
              span(classes: 'edu-label', [Component.text('학력')]),
              span(classes: 'edu-text', [Component.text(Profile.education)]),
            ]),
            div(classes: 'hero-contacts', [
              for (final c in Profile.contacts) _contactChip(c),
            ]),
            div(classes: 'hero-cta', [
              a(href: '#projects', classes: 'btn btn-primary', [
                Component.text('프로젝트 보기'),
                span(classes: 'arr', [Component.text('→')]),
              ]),
              a(
                href: 'mailto:thesims1004@gmail.com',
                classes: 'btn btn-ghost',
                [Component.text('이메일 보내기')],
              ),
            ]),
          ]),
        ]),
      ]),
      // Highlights band.
      section(classes: 'highlights', [
        div(classes: 'container', [
          span(classes: 'overline', [Component.text('Highlights')]),
          div(classes: 'hl-grid', [
            for (final s in Profile.stats)
              div(classes: 'hl-card', [
                span(classes: 'hl-value', [Component.text(s.value)]),
                span(classes: 'hl-label', [Component.text(s.label)]),
              ]),
          ]),
        ]),
      ]),
    ]);
  }

  static Component _contactChip(ProfileContact c) {
    final children = [
      span(classes: 'cc-label', [Component.text(c.label)]),
      span(classes: 'cc-value', [Component.text(c.value)]),
    ];
    if (c.pending) {
      return div(classes: 'contact-chip pending', children);
    }
    return a(href: c.href!, classes: 'contact-chip', children);
  }

  @css
  static List<StyleRule> get styles => [
        css('.hero').styles(
          padding: .only(top: 72.px, bottom: AppSpacing.xl.px),
        ),
        css('.hero-grid').styles(
          display: .grid,
          gap: Gap.all(AppSpacing.xl.px),
          alignItems: .start,
          raw: {'grid-template-columns': 'minmax(0, 320px) minmax(0, 1fr)'},
        ),
        // Photo slot.
        css('.photo-slot', [
          css('&').styles(
            display: .flex,
            flexDirection: .column,
            gap: Gap.all(AppSpacing.s.px),
            justifyContent: .center,
            alignItems: .center,
            width: 100.percent,
            backgroundColor: AppColors.surface,
            border: Border.all(color: AppColors.border, width: 1.px),
            radius: .circular(AppRadius.l.px),
            color: AppColors.textFaint,
            raw: {'aspect-ratio': '1 / 1.1'},
          ),
          css('.photo-ico').styles(fontSize: 2.rem, color: AppColors.borderStrong),
          css('.photo-cap').styles(
              fontSize: AppType.small.rem, fontFamily: AppFonts.en),
        ]),
        css('.photo-img').styles(
          width: 100.percent,
          backgroundColor: AppColors.surface,
          border: Border.all(color: AppColors.border, width: 1.px),
          radius: .circular(AppRadius.l.px),
          raw: {'aspect-ratio': '1 / 1.1', 'object-fit': 'cover'},
        ),
        // Identity.
        css('.hero-main').styles(
          display: .flex,
          flexDirection: .column,
          alignItems: .start,
          gap: Gap.all(AppSpacing.m.px),
        ),
        css('.open-badge', [
          css('&').styles(
            display: .inlineFlex,
            alignItems: .center,
            gap: Gap.all(AppSpacing.s.px),
            padding: .symmetric(horizontal: 12.px, vertical: 6.px),
            color: AppColors.success,
            backgroundColor: AppColors.successBg,
            radius: .circular(AppRadius.full.px),
            fontSize: AppType.tiny.rem,
            fontWeight: .w600,
          ),
          css('.dot').styles(
            width: 7.px,
            height: 7.px,
            backgroundColor: AppColors.success,
            radius: .circular(AppRadius.full.px),
          ),
        ]),
        css('.hero-name', [
          css('&').styles(
            display: .flex,
            alignItems: .baseline,
            flexWrap: .wrap,
            gap: Gap.all(AppSpacing.m.px),
            color: AppColors.text,
            fontWeight: .w800,
            letterSpacing: (-1.5).px,
            raw: {'font-size': 'clamp(2.25rem, 7vw, 3.25rem)'},
          ),
          css('.hero-name-en').styles(
            color: AppColors.textMuted,
            fontWeight: .w500,
            fontFamily: AppFonts.en,
            letterSpacing: (-0.5).px,
            raw: {'font-size': 'clamp(1.25rem, 4vw, 1.75rem)'},
          ),
        ]),
        css('.hero-title', [
          css('&').styles(
            color: AppColors.textMuted,
            fontSize: AppType.lead.rem,
            fontWeight: .w500,
          ),
          css('.title-strong').styles(
              color: AppColors.primary, fontWeight: .w700),
        ]),
        css('.hero-intro').styles(
          maxWidth: 640.px,
          color: AppColors.textMuted,
          fontSize: AppType.body.rem,
          lineHeight: 1.75.em,
        ),
        css('.hero-edu', [
          css('&').styles(
            display: .flex,
            alignItems: .center,
            gap: Gap.all(AppSpacing.m.px),
          ),
          css('.edu-label').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            fontSize: AppType.micro.rem,
            letterSpacing: 1.px,
            textTransform: .upperCase,
          ),
          css('.edu-text').styles(
              color: AppColors.text, fontSize: AppType.small.rem),
        ]),
        // Contact chips.
        css('.hero-contacts').styles(
          display: .flex,
          flexWrap: .wrap,
          gap: Gap.all(AppSpacing.s.px),
        ),
        css('.contact-chip', [
          css('&').styles(
            display: .inlineFlex,
            alignItems: .center,
            gap: Gap.all(AppSpacing.s.px),
            padding: .symmetric(horizontal: 12.px, vertical: 8.px),
            backgroundColor: AppColors.white,
            border: Border.all(color: AppColors.border, width: 1.px),
            radius: .circular(AppRadius.s.px),
            transition:
                Transition('border-color', duration: Duration(milliseconds: 150)),
          ),
          css('&:hover').styles(border: Border.all(color: AppColors.accent, width: 1.px)),
          css('.cc-label').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            fontSize: AppType.micro.rem,
            letterSpacing: 0.5.px,
            textTransform: .upperCase,
          ),
          css('.cc-value').styles(
            color: AppColors.text,
            fontSize: AppType.small.rem,
            fontFamily: AppFonts.en,
          ),
        ]),
        css('.contact-chip.pending', [
          css('&').styles(backgroundColor: AppColors.surface),
          css('.cc-value').styles(color: AppColors.textFaint),
        ]),
        // CTAs.
        css('.hero-cta').styles(
          display: .flex,
          flexWrap: .wrap,
          gap: Gap.all(AppSpacing.m.px),
          margin: .only(top: AppSpacing.s.px),
        ),
        css('.btn', [
          css('&').styles(
            display: .inlineFlex,
            alignItems: .center,
            gap: Gap.all(AppSpacing.s.px),
            padding: .symmetric(horizontal: 22.px, vertical: 13.px),
            radius: .circular(AppRadius.s.px),
            fontSize: AppType.small.rem,
            fontWeight: .w600,
            cursor: .pointer,
            transition: Transition('all', duration: Duration(milliseconds: 150)),
            raw: {'white-space': 'nowrap'},
          ),
        ]),
        css('.btn-primary', [
          css('&').styles(color: AppColors.white, backgroundColor: AppColors.primary),
          css('&:hover').styles(
            backgroundColor: AppColors.primaryDark,
            raw: {'transform': 'translateY(-1px)'},
          ),
          css('.arr').styles(fontFamily: AppFonts.en),
        ]),
        css('.btn-ghost', [
          css('&').styles(
            color: AppColors.text,
            backgroundColor: AppColors.white,
            border: Border.all(color: AppColors.borderStrong, width: 1.px),
          ),
          css('&:hover').styles(border: Border.all(color: AppColors.primary, width: 1.px)),
        ]),
        // Highlights band.
        css('.highlights').styles(
          padding: .only(bottom: AppSpacing.xl.px),
        ),
        css('.hl-grid').styles(
          display: .grid,
          gap: Gap.all(AppSpacing.m.px),
          margin: .only(top: AppSpacing.m.px),
          raw: {'grid-template-columns': 'repeat(auto-fit, minmax(200px, 1fr))'},
        ),
        css('.hl-card', [
          css('&').styles(
            display: .flex,
            flexDirection: .column,
            gap: Gap.all(AppSpacing.xs.px),
            padding: .all(AppSpacing.l.px),
            backgroundColor: AppColors.surface,
            border: Border.all(color: AppColors.border, width: 1.px),
            radius: .circular(AppRadius.m.px),
          ),
          css('.hl-value').styles(
            color: AppColors.primary,
            fontSize: 1.6.rem,
            fontWeight: .w800,
            fontFamily: AppFonts.en,
            letterSpacing: (-0.5).px,
          ),
          css('.hl-label').styles(
              color: AppColors.textMuted, fontSize: AppType.small.rem),
        ]),

        // Collapse the two-column hero to a single column on small screens.
        css.media(MediaQuery.all(maxWidth: 760.px), [
          css('.hero-grid').styles(raw: {'grid-template-columns': '1fr'}),
          css('.hero-photo').styles(maxWidth: 360.px),
        ]),
      ];
}
