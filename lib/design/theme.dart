import 'package:jaspr/dom.dart';

import 'tokens.dart';

/// Global, document-level styles (reset + base typography + shared layout
/// utilities). Included once in the root [Document]. Component-specific styles
/// live next to their component via the `@css` annotation.
List<StyleRule> get globalStyles => [
      css('*, *::before, *::after').styles(boxSizing: .borderBox),
      css('html').styles(
        raw: {'scroll-behavior': 'smooth', 'scroll-padding-top': '72px'},
      ),
      css('body').styles(
        width: 100.percent,
        minHeight: 100.vh,
        margin: .zero,
        padding: .zero,
        color: AppColors.text,
        backgroundColor: AppColors.background,
        fontFamily: AppFonts.kr,
        fontSize: AppType.body.rem,
        lineHeight: 1.6.em,
        raw: {
          'overflow-x': 'hidden',
          '-webkit-font-smoothing': 'antialiased',
          'text-rendering': 'optimizeLegibility',
        },
      ),
      css('h1, h2, h3, h4, p').styles(margin: .zero),
      css('h1, h2, h3').styles(
        letterSpacing: (-0.4).px,
        lineHeight: 1.2.em,
      ),
      css('a').styles(
        color: AppColors.primary,
        textDecoration: TextDecoration(line: .none),
      ),
      css('img').styles(maxWidth: 100.percent, display: .block),
      css('ul').styles(margin: .zero, padding: .zero, listStyle: ListStyle.none),

      // Shared layout utilities.
      css('.container').styles(
        width: 100.percent,
        maxWidth: AppLayout.maxWidth.px,
        margin: .symmetric(horizontal: Unit.auto),
        padding: .symmetric(horizontal: AppSpacing.l.px),
      ),
      css('.section').styles(
        padding: .symmetric(vertical: AppSpacing.xxl.px),
      ),
      // Mono uppercase micro-label used as a section/overline eyebrow.
      css('.overline').styles(
        display: .block,
        color: AppColors.textFaint,
        fontFamily: AppFonts.mono,
        fontSize: AppType.micro.rem,
        fontWeight: .w500,
        letterSpacing: 1.5.px,
        textTransform: .upperCase,
      ),
      // Scroll fade-in (progressive enhancement; visible by default if no JS).
      css('.reveal').styles(raw: {
        'opacity': '1',
        'transition': 'opacity .6s ease, transform .6s ease',
      }),
    ];
