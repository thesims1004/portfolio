import 'package:jaspr/dom.dart';

import 'tokens.dart';

/// Global document-level styles (reset + base typography + shared utilities).
List<StyleRule> get globalStyles => [
      css('*, *::before, *::after').styles(boxSizing: .borderBox),
      css('html').styles(raw: {
        'scroll-behavior': 'smooth',
        'scroll-padding-top': '72px',
      }),
      css('body').styles(
        width: 100.percent,
        minHeight: 100.vh,
        margin: .zero,
        padding: .zero,
        color: AppColors.text,
        backgroundColor: AppColors.background,
        fontFamily: AppFonts.sans,
        fontSize: AppType.body.px,
        lineHeight: 1.6.em,
        raw: {
          'overflow-x': 'hidden',
          '-webkit-font-smoothing': 'antialiased',
          'text-rendering': 'optimizeLegibility',
        },
      ),
      css('h1, h2, h3, h4, p').styles(margin: .zero),
      css('a').styles(
        color: const Color('inherit'),
        textDecoration: TextDecoration(line: .none),
      ),
      css('img').styles(maxWidth: 100.percent, display: .block),
      css('ul').styles(margin: .zero, padding: .zero, listStyle: ListStyle.none),

      // Layout utilities.
      css('.container').styles(
        width: 100.percent,
        maxWidth: AppLayout.maxWidth.px,
        margin: .symmetric(horizontal: Unit.auto),
        padding: .symmetric(horizontal: AppSpacing.l.px),
      ),
      css('.section').styles(raw: {'padding': 'clamp(56px,8vw,96px) 24px'}),
      // Mono uppercase micro-label (section eyebrow / overline).
      css('.overline').styles(
        display: .block,
        color: AppColors.textFaint,
        fontFamily: AppFonts.mono,
        raw: {
          'font-size': '12px',
          'letter-spacing': '0.16em',
          'text-transform': 'uppercase',
          'margin-bottom': '18px',
        },
      ),
    ];
