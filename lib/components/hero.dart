import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/profile.dart';
import '../design/tokens.dart';

/// Landing hero — résumé-style profile card (photo + identity + intro +
/// education + contact + CTAs) with a secondary Highlights band inside the
/// same header block. Layout/values mirror the Claude Design source.
class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return header(id: 'top', classes: 'hero', [
      div(classes: 'container hero-inner', [
        div(classes: 'hero-row', [
          // Profile photo (small, 4:5).
          div(classes: 'hero-photo', [
            if (Profile.photo != null)
              img(classes: 'photo-img', src: Profile.photo!, alt: Profile.name)
            else
              div(classes: 'photo-slot', [Component.text('프로필 사진')]),
          ]),
          // Identity + intro + contact.
          div(classes: 'hero-info', [
            span(classes: 'open-badge', [
              span(classes: 'dot', []),
              Component.text(Profile.badge),
            ]),
            h1(classes: 'hero-name', [
              Component.text(Profile.name),
              Component.text(' '),
              span(classes: 'hero-name-en', [Component.text(Profile.nameEn)]),
            ]),
            div(classes: 'hero-title', [
              Component.text('앱 개발자'),
              span(classes: 'title-rest', [
                Component.text(' · Mobile · Desktop · AI 스마트 글래스'),
              ]),
            ]),
            p(classes: 'hero-intro', [
              Component.text('15년 넘게 다양한 산업군의 모바일·데스크톱 앱을 직접 개발·출시해온 개발자입니다. '
                  'ETRI · LS산전 · 코웨이 · 세라젬 · 반다이남코코리아 · 함소아한의원 · 플랫폼플레이스 등 '
                  '여러 기업의 외주와 함께, 자체 서비스 앱으로 누적 '),
              span(classes: 'em', [Component.text('500만 · 100만 다운로드')]),
              Component.text(' 성과도 만들어왔습니다. 현재는 시어스랩(Seerslab)에서 AI 스마트 글래스 '
                  '제품을 담당하고 있습니다.'),
            ]),
            div(classes: 'hero-edu', [
              span(classes: 'edu-label', [Component.text('학력')]),
              span([Component.text(Profile.education)]),
            ]),
            div(classes: 'hero-contacts', [
              for (final c in Profile.contacts) _contactChip(c),
            ]),
            div(classes: 'hero-cta', [
              a(href: '#projects', classes: 'btn btn-primary', [
                Component.text('프로젝트 보기 →'),
              ]),
              a(
                href: 'mailto:thesims1004@gmail.com',
                classes: 'btn btn-ghost',
                [Component.text('이메일 보내기')],
              ),
            ]),
          ]),
        ]),
        // Highlights (secondary, inside the hero with a top divider).
        div(classes: 'highlights', [
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
    if (c.pending) return div(classes: 'contact-chip pending', children);
    return a(href: c.href!, classes: 'contact-chip', children);
  }

  @css
  static List<StyleRule> get styles => [
        css('.hero').styles(
          border: Border.only(
              bottom: BorderSide(color: AppColors.borderSoft, width: 1.px)),
        ),
        css('.hero-inner').styles(raw: {
          'padding': 'clamp(44px,7vw,84px) 24px clamp(36px,5vw,56px)',
        }),
        css('.hero-row').styles(
          display: .flex,
          flexWrap: .wrap,
          alignItems: .start,
          raw: {'gap': 'clamp(28px,4vw,52px)'},
        ),
        // Photo — small, 4:5.
        css('.hero-photo').styles(raw: {'flex': '0 0 auto'}),
        css('.photo-img').styles(raw: {
          'display': 'block',
          'width': 'clamp(168px,22vw,228px)',
          'aspect-ratio': '4 / 5',
          'object-fit': 'cover',
          'border-radius': '14px',
          'box-shadow': '0 18px 44px rgba(16,24,40,0.14)',
        }),
        css('.photo-slot').styles(
          display: .flex,
          alignItems: .center,
          justifyContent: .center,
          color: AppColors.textFaint,
          backgroundColor: AppColors.surface,
          border: Border.all(color: AppColors.border, width: 1.px),
          fontSize: AppType.small.px,
          raw: {
            'width': 'clamp(168px,22vw,228px)',
            'aspect-ratio': '4 / 5',
            'border-radius': '14px',
          },
        ),
        // Info column.
        css('.hero-info').styles(raw: {'flex': '1 1 440px', 'min-width': '0'}),
        css('.open-badge', [
          css('&').styles(
            display: .inlineFlex,
            alignItems: .center,
            gap: Gap.all(AppSpacing.s.px),
            color: AppColors.primary,
            backgroundColor: AppColors.blueBg,
            border: Border.all(color: AppColors.blueBorder, width: 1.px),
            fontFamily: AppFonts.mono,
            fontWeight: .w500,
            raw: {
              'font-size': '12px',
              'letter-spacing': '0.04em',
              'border-radius': '999px',
              'padding': '6px 13px',
              'margin-bottom': '20px',
            },
          ),
          css('.dot').styles(
            width: 7.px,
            height: 7.px,
            backgroundColor: AppColors.success,
            raw: {'border-radius': '50%'},
          ),
        ]),
        css('.hero-name', [
          css('&').styles(
            color: AppColors.text,
            fontWeight: .w700,
            raw: {
              'font-size': 'clamp(34px,5.2vw,52px)',
              'line-height': '1.05',
              'letter-spacing': '-0.03em',
              'margin': '0 0 8px',
            },
          ),
          css('.hero-name-en').styles(
            color: AppColors.textFaint,
            fontWeight: .w600,
            raw: {
              'font-size': '0.5em',
              'letter-spacing': '0',
              'vertical-align': 'middle',
            },
          ),
        ]),
        css('.hero-title', [
          css('&').styles(
            color: AppColors.primary,
            fontWeight: .w600,
            raw: {
              'font-size': 'clamp(17px,2.2vw,21px)',
              'letter-spacing': '-0.01em',
              'margin-bottom': '20px',
            },
          ),
          css('.title-rest').styles(color: AppColors.textFaint, fontWeight: .w500),
        ]),
        css('.hero-intro', [
          css('&').styles(
            color: AppColors.textMuted,
            raw: {
              'font-size': 'clamp(15px,1.7vw,16px)',
              'line-height': '1.75',
              'max-width': '600px',
              'margin': '0 0 22px',
            },
          ),
          css('.em').styles(color: AppColors.text, fontWeight: .w600),
        ]),
        css('.hero-edu', [
          css('&').styles(
            display: .flex,
            alignItems: .baseline,
            gap: Gap.all(10.px),
            color: AppColors.textMuted,
            fontSize: AppType.small.px,
            raw: {'margin': '0 0 22px'},
          ),
          css('.edu-label').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            raw: {
              'font-size': '11px',
              'letter-spacing': '0.1em',
              'text-transform': 'uppercase',
              'flex': '0 0 auto',
            },
          ),
        ]),
        // Contact chips.
        css('.hero-contacts').styles(
          display: .flex,
          flexWrap: .wrap,
          gap: Gap.all(AppSpacing.s.px),
          raw: {'margin-bottom': '28px'},
        ),
        css('.contact-chip', [
          css('&').styles(
            display: .inlineFlex,
            alignItems: .center,
            gap: Gap.all(AppSpacing.s.px),
            color: AppColors.text,
            backgroundColor: AppColors.white,
            border: Border.all(color: AppColors.border, width: 1.px),
            fontSize: AppType.tiny.px,
            fontWeight: .w500,
            raw: {'border-radius': '7px', 'padding': '8px 13px'},
          ),
          css('&:hover').styles(
            border: Border.all(color: AppColors.blueChipBorder, width: 1.px),
            raw: {'box-shadow': '0 4px 12px rgba(16,24,40,0.06)'},
          ),
          css('.cc-label').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            raw: {
              'font-size': '10px',
              'letter-spacing': '0.08em',
              'text-transform': 'uppercase',
            },
          ),
          css('.cc-value').styles(fontFamily: AppFonts.sans),
        ]),
        css('.contact-chip.pending', [
          css('&').styles(
            color: AppColors.textFaint,
            backgroundColor: const Color('#FBFCFD'),
            border: Border.all(color: AppColors.borderStrong, width: 1.px),
            raw: {'border-style': 'dashed'},
          ),
        ]),
        // CTAs.
        css('.hero-cta').styles(
            display: .flex, flexWrap: .wrap, gap: Gap.all(12.px)),
        css('.btn').styles(
          display: .inlineFlex,
          alignItems: .center,
          fontWeight: .w600,
          cursor: .pointer,
          raw: {
            'font-size': '15px',
            'border-radius': '7px',
            'padding': '13px 24px',
            'white-space': 'nowrap',
            'letter-spacing': '-0.01em',
            'transition': 'background .16s, border-color .16s, transform .16s',
          },
        ),
        css('.btn-primary', [
          css('&').styles(color: AppColors.white, backgroundColor: AppColors.primary),
          css('&:hover').styles(backgroundColor: AppColors.primaryDark),
        ]),
        css('.btn-ghost', [
          css('&').styles(
            color: AppColors.text,
            backgroundColor: AppColors.white,
            border: Border.all(color: AppColors.borderStrong, width: 1.px),
          ),
          css('&:hover').styles(
            backgroundColor: const Color('#F7F9FB'),
            border: Border.all(color: AppColors.borderStrongHover, width: 1.px),
          ),
        ]),
        // Highlights band (inside hero).
        css('.highlights').styles(
          border: Border.only(
              top: BorderSide(color: AppColors.borderFaint, width: 1.px)),
          raw: {
            'margin-top': 'clamp(34px,5vw,48px)',
            'padding-top': 'clamp(26px,4vw,34px)',
          },
        ),
        css('.hl-grid').styles(
          display: .grid,
          gap: Gap.all(12.px),
          raw: {'grid-template-columns': 'repeat(auto-fit,minmax(160px,1fr))'},
        ),
        css('.hl-card', [
          css('&').styles(
            backgroundColor: AppColors.surface,
            border: Border.all(color: AppColors.borderFaint, width: 1.px),
            raw: {'border-radius': '8px', 'padding': '16px 18px'},
          ),
          css('.hl-value').styles(
            display: .block,
            color: AppColors.primary,
            fontWeight: .w700,
            raw: {
              'font-size': '22px',
              'letter-spacing': '-0.02em',
              'margin-bottom': '2px',
            },
          ),
          css('.hl-label').styles(color: AppColors.textMuted, fontSize: AppType.tiny.px),
        ]),
      ];
}
