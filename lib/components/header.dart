import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/profile.dart';
import '../design/tokens.dart';

/// Sticky, blurred top navigation. Anchor links scroll to in-page sections.
class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    return header(classes: 'site-header', [
      div(classes: 'container header-inner', [
        a(href: '#top', classes: 'brand', [
          span(classes: 'brand-name', [Component.text(Profile.name)]),
          span(classes: 'brand-sub', [Component.text('· ${Profile.nameEn}')]),
        ]),
        nav(classes: 'site-nav', [
          a(href: '#skills', classes: 'nav-link', [Component.text('Skills')]),
          a(href: '#projects', classes: 'nav-link', [Component.text('Projects')]),
          a(
            href: 'mailto:thesims1004@gmail.com',
            classes: 'nav-cta',
            [Component.text('이메일')],
          ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.site-header', [
          css('&').styles(
            position: .sticky(top: Unit.zero),
            zIndex: const ZIndex(100),
            width: 100.percent,
            backgroundColor: AppColors.headerBg,
            border: Border.only(
                bottom: BorderSide(color: AppColors.border, width: 1.px)),
            raw: {'backdrop-filter': 'blur(12px)'},
          ),
          css('.header-inner').styles(
            display: .flex,
            height: 60.px,
            alignItems: .center,
            justifyContent: .spaceBetween,
          ),
          css('.brand', [
            css('&').styles(
              display: .flex,
              alignItems: .baseline,
              gap: Gap.all(AppSpacing.s.px),
              color: AppColors.text,
            ),
            css('.brand-name').styles(
              fontSize: 1.05.rem,
              fontWeight: .w700,
              letterSpacing: (-0.3).px,
            ),
            css('.brand-sub').styles(
              color: AppColors.textFaint,
              fontSize: AppType.tiny.rem,
              fontFamily: AppFonts.en,
            ),
          ]),
          css('.site-nav').styles(
            display: .flex,
            alignItems: .center,
            gap: Gap.all(AppSpacing.l.px),
          ),
          css('.nav-link', [
            css('&').styles(
              color: AppColors.textMuted,
              fontSize: AppType.small.rem,
              fontWeight: .w500,
              fontFamily: AppFonts.en,
              transition:
                  Transition('color', duration: Duration(milliseconds: 150)),
            ),
            css('&:hover').styles(color: AppColors.text),
          ]),
          css('.nav-cta', [
            css('&').styles(
              padding: .symmetric(horizontal: 16.px, vertical: 8.px),
              color: AppColors.white,
              backgroundColor: AppColors.primary,
              radius: .circular(AppRadius.s.px),
              fontSize: AppType.small.rem,
              fontWeight: .w600,
              raw: {'white-space': 'nowrap'},
              transition: Transition('background-color',
                  duration: Duration(milliseconds: 150)),
            ),
            css('&:hover').styles(backgroundColor: AppColors.primaryDark),
          ]),
        ]),
        // On phones, drop the romanized name and tighten nav spacing.
        css.media(MediaQuery.all(maxWidth: 520.px), [
          css('.site-header .brand-sub').styles(display: .none),
          css('.site-header .site-nav').styles(gap: Gap.all(AppSpacing.m.px)),
        ]),
      ];
}
