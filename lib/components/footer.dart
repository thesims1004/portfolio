import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/profile.dart';
import '../design/tokens.dart';

/// Contact section + site footer. Doubles as the `#contact` anchor target.
class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      section(id: 'contact', classes: 'section contact', [
        div(classes: 'container contact-inner', [
          span(classes: 'overline', [Component.text('Contact')]),
          h2(classes: 'contact-title', [
            Component.text('함께 만들 디바이스가 있다면, 편하게 연락 주세요.'),
          ]),
          p(classes: 'contact-lead', [
            Component.text('채용·협업 문의를 환영합니다. 이메일이 가장 빠릅니다.'),
          ]),
          div(classes: 'contact-list', [
            for (final c in Profile.contacts)
              if (!c.pending)
                a(href: c.href!, classes: 'contact-item', [
                  span(classes: 'ci-label', [Component.text(c.label)]),
                  span(classes: 'ci-value', [Component.text(c.value)]),
                ]),
          ]),
        ]),
      ]),
      footer(classes: 'site-footer', [
        div(classes: 'container footer-inner', [
          span([Component.text('© 2026 ${Profile.name} · ${Profile.nameEn}')]),
          span(classes: 'footer-built', [Component.text('Built with Jaspr')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.contact', [
          css('&').styles(backgroundColor: AppColors.white),
          css('.contact-title').styles(
            margin: .only(top: AppSpacing.s.px),
            maxWidth: 620.px,
            color: AppColors.text,
            fontSize: AppType.h2.rem,
            fontWeight: .w800,
          ),
          css('.contact-lead').styles(
            margin: .only(top: AppSpacing.m.px, bottom: AppSpacing.xl.px),
            color: AppColors.textMuted,
            fontSize: AppType.lead.rem,
          ),
          css('.contact-list').styles(
            display: .flex,
            flexWrap: .wrap,
            gap: Gap.all(AppSpacing.m.px),
          ),
          css('.contact-item', [
            css('&').styles(
              display: .flex,
              flexDirection: .column,
              gap: Gap.all(AppSpacing.xs.px),
              padding:
                  .symmetric(horizontal: AppSpacing.l.px, vertical: AppSpacing.m.px),
              backgroundColor: AppColors.surface,
              border: Border.all(color: AppColors.border, width: 1.px),
              radius: .circular(AppRadius.m.px),
              transition: Transition('all', duration: Duration(milliseconds: 150)),
            ),
            css('&:hover').styles(
              border: Border.all(color: AppColors.primary, width: 1.px),
              raw: {'transform': 'translateY(-2px)'},
            ),
            css('.ci-label').styles(
              color: AppColors.textFaint,
              fontFamily: AppFonts.mono,
              fontSize: AppType.micro.rem,
              letterSpacing: 0.5.px,
              textTransform: .upperCase,
            ),
            css('.ci-value').styles(
              color: AppColors.text,
              fontSize: AppType.lead.rem,
              fontWeight: .w600,
              fontFamily: AppFonts.en,
            ),
          ]),
        ]),
        css('.site-footer', [
          css('&').styles(
            padding: .symmetric(vertical: AppSpacing.l.px),
            border: Border.only(
                top: BorderSide(color: AppColors.border, width: 1.px)),
            backgroundColor: AppColors.background,
          ),
          css('.footer-inner').styles(
            display: .flex,
            flexWrap: .wrap,
            gap: Gap.all(AppSpacing.s.px),
            justifyContent: .spaceBetween,
            color: AppColors.textFaint,
            fontSize: AppType.small.rem,
          ),
          css('.footer-built').styles(fontFamily: AppFonts.en),
        ]),
      ];
}
