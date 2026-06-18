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
        div(classes: 'inner', [
          span(classes: 'overline', [Component.text('Contact')]),
          h2(classes: 'contact-title', [
            Component.text('새로운 기회를 찾고 있습니다.'),
          ]),
          p(classes: 'contact-lead', [
            Component.text('채용·협업 제안을 환영합니다. 이메일로 연락 주시면 가장 빠르게 답변드리겠습니다.'),
          ]),
          div(classes: 'contact-grid', [
            for (final c in Profile.contacts)
              if (!c.pending)
                a(href: c.href!, classes: 'contact-card', [
                  div(classes: 'cc-label', [Component.text(c.label)]),
                  div(classes: 'cc-value', [Component.text(c.value)]),
                ]),
          ]),
        ]),
      ]),
      footer(classes: 'site-footer', [
        div(classes: 'inner footer-inner', [
          span(classes: 'copy', [
            Component.text('© 2026 ${Profile.name} (${Profile.nameEn})'),
          ]),
          span(classes: 'built', [Component.text('Built with Jaspr')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.contact .inner').styles(
          width: 100.percent,
          maxWidth: AppLayout.maxWidth.px,
          margin: .symmetric(horizontal: Unit.auto),
        ),
        css('.contact-title').styles(
          color: AppColors.text,
          fontWeight: .w700,
          raw: {
            'font-size': 'clamp(26px,4vw,40px)',
            'line-height': '1.2',
            'letter-spacing': '-0.025em',
            'margin': '0 0 16px',
            'max-width': '620px',
          },
        ),
        css('.contact-lead').styles(
          color: AppColors.textMuted,
          raw: {
            'font-size': '16px',
            'line-height': '1.7',
            'margin': '0 0 36px',
            'max-width': '520px',
          },
        ),
        css('.contact-grid').styles(
          display: .grid,
          gap: Gap.all(14.px),
          raw: {
            'grid-template-columns': 'repeat(auto-fit,minmax(220px,1fr))',
            'max-width': '760px',
          },
        ),
        css('.contact-card', [
          css('&').styles(
            display: .block,
            backgroundColor: AppColors.white,
            border: Border.all(color: AppColors.border, width: 1.px),
            raw: {
              'border-radius': '9px',
              'padding': '20px',
              'transition': 'border-color .16s, box-shadow .16s',
            },
          ),
          css('&:hover').styles(
            border: Border.all(color: AppColors.blueChipBorder, width: 1.px),
            raw: {'box-shadow': '0 8px 22px rgba(16,24,40,0.08)'},
          ),
          css('.cc-label').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            raw: {
              'font-size': '11px',
              'letter-spacing': '0.1em',
              'text-transform': 'uppercase',
              'margin-bottom': '8px',
            },
          ),
          css('.cc-value').styles(
            color: AppColors.primary,
            fontWeight: .w600,
            raw: {'font-size': '15px', 'word-break': 'break-all'},
          ),
        ]),
        // Footer.
        css('.site-footer', [
          css('&').styles(
            backgroundColor: AppColors.surface,
            border: Border.only(
                top: BorderSide(color: AppColors.borderSoft, width: 1.px)),
          ),
          css('.footer-inner').styles(
            width: 100.percent,
            maxWidth: AppLayout.maxWidth.px,
            margin: .symmetric(horizontal: Unit.auto),
            display: .flex,
            flexWrap: .wrap,
            alignItems: .center,
            justifyContent: .spaceBetween,
            gap: Gap.all(12.px),
            raw: {'padding': '28px 24px'},
          ),
          css('.copy').styles(color: AppColors.textFaint, fontSize: AppType.tiny.px),
          css('.built').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            raw: {'font-size': '12px'},
          ),
        ]),
      ];
}
