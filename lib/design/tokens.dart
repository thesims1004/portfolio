import 'package:jaspr/dom.dart';

/// Design tokens — single source of truth for color, typography, spacing,
/// radius and breakpoints. Modeled after the "Modern" tone of the Claude Design
/// deliverable: hairline borders, mono uppercase micro-labels, tight radii,
/// #2E5A8C seed, generous whitespace.
///
/// `abstract final class` prevents instantiation (project convention: no magic
/// numbers, every literal lives in a token class).

abstract final class AppColors {
  static const primary = Color('#2E5A8C');
  static const primaryDark = Color('#1E3F66');
  static const accent = Color('#3A6BA5');

  static const text = Color('#1A1D23');
  static const textMuted = Color('#5B6573');
  static const textFaint = Color('#9AA3B0');

  static const background = Color('#FFFFFF');
  static const surface = Color('#F7F8FA');
  static const surfaceSunken = Color('#F1F3F6');
  static const border = Color('#E6E8EC');
  static const borderStrong = Color('#D4D8DF');

  static const chipBg = Color('#F1F3F6');
  static const chipText = Color('#4B5563');

  static const success = Color('#1F9D55');
  static const successBg = Color('rgba(31, 157, 85, 0.10)');

  // IMPACT callout tint.
  static const impactBg = Color('#F2F6FB');
  static const impactBorder = Color('#D8E3F0');

  // Translucent helpers.
  static const headerBg = Color('rgba(255, 255, 255, 0.82)');
  static const overlay = Color('rgba(20, 24, 31, 0.45)');
  static const primarySoft = Color('rgba(46, 90, 140, 0.08)');
  static const white = Color('#FFFFFF');
}

abstract final class AppFonts {
  static const kr = FontFamily.list([
    FontFamily('Pretendard'),
    FontFamilies.sansSerif,
  ]);
  static const en = FontFamily.list([
    FontFamily('Inter'),
    FontFamily('Pretendard'),
    FontFamilies.sansSerif,
  ]);
  static const mono = FontFamily.list([
    FontFamily('JetBrains Mono'),
    FontFamilies.monospace,
  ]);
}

/// Font sizes in rem. Use as `AppType.h1.rem`.
abstract final class AppType {
  static const double display = 3.25; // hero name
  static const double h1 = 2.5;
  static const double h2 = 2;
  static const double h3 = 1.5;
  static const double lead = 1.125;
  static const double body = 1;
  static const double small = 0.875;
  static const double tiny = 0.8125;
  static const double micro = 0.6875; // mono uppercase labels
}

/// Spacing scale in px. Use as `AppSpacing.m.px`.
abstract final class AppSpacing {
  static const double xs = 4;
  static const double s = 8;
  static const double m = 16;
  static const double l = 24;
  static const double xl = 48;
  static const double xxl = 88;
}

/// Border radius in px. Use as `AppRadius.m.px`. (Tight — Modern tone.)
abstract final class AppRadius {
  static const double xs = 4;
  static const double s = 6;
  static const double m = 8;
  static const double l = 12;
  static const double full = 999;
}

abstract final class AppLayout {
  static const double maxWidth = 1120;
}

/// Responsive breakpoints (max-width in px). 1280+ is desktop.
abstract final class AppBreakpoints {
  static const int mobile = 767;
  static const int tablet = 1023;
}
