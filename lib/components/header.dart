import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/profile.dart';
import '../design/tokens.dart';

/// Sticky, blurred top navigation.
class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    return nav(classes: 'site-header', [
      div(classes: 'container header-inner', [
        a(href: '#top', classes: 'brand', [
          Component.text(Profile.name),
          span(classes: 'brand-sub', [Component.text(' · ${Profile.nameEn}')]),
        ]),
        div(classes: 'site-nav', [
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
            zIndex: const ZIndex(50),
            backgroundColor: AppColors.headerBg,
            border: Border.only(
                bottom: BorderSide(color: AppColors.borderSoft, width: 1.px)),
            raw: {'backdrop-filter': 'saturate(180%) blur(12px)'},
          ),
          css('.header-inner').styles(
            display: .flex,
            height: 60.px,
            alignItems: .center,
            justifyContent: .spaceBetween,
            gap: Gap.all(AppSpacing.m.px),
          ),
          css('.brand', [
            css('&').styles(
              color: AppColors.text,
              fontWeight: .w700,
              raw: {'font-size': '16px', 'letter-spacing': '-0.01em'},
            ),
            css('.brand-sub').styles(color: AppColors.textFaint, fontWeight: .w500),
          ]),
          css('.site-nav').styles(
            display: .flex,
            alignItems: .center,
            flexWrap: .wrap,
            gap: Gap.all(6.px),
          ),
          css('.nav-link', [
            css('&').styles(
              color: AppColors.textMuted,
              fontSize: AppType.small.px,
              fontWeight: .w500,
              raw: {
                'padding': '8px 12px',
                'border-radius': '6px',
                'transition': 'color .15s, background .15s',
              },
            ),
            css('&:hover').styles(
                color: AppColors.text, backgroundColor: AppColors.navHover),
          ]),
          css('.nav-cta', [
            css('&').styles(
              color: AppColors.white,
              backgroundColor: AppColors.primary,
              fontSize: AppType.small.px,
              fontWeight: .w600,
              raw: {
                'padding': '8px 16px',
                'border-radius': '6px',
                'margin-left': '6px',
                'white-space': 'nowrap',
                'transition': 'background .15s',
              },
            ),
            css('&:hover').styles(backgroundColor: AppColors.primaryDark),
          ]),
        ]),
        css.media(MediaQuery.all(maxWidth: 520.px), [
          css('.site-header .brand-sub').styles(display: .none),
        ]),
      ];
}
