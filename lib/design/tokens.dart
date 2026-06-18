import 'package:jaspr/dom.dart';

/// Design tokens — exact values from the Claude Design "Portfolio A — Top Hero"
/// (Modern tone) deliverable. `abstract final class` prevents instantiation.

abstract final class AppColors {
  static const primary = Color('#2E5A8C');
  static const primaryDark = Color('#234A78'); // hover
  static const accent = Color('#2E5A8C');

  static const text = Color('#16181D');
  static const textMuted = Color('#5B6470');
  static const textFaint = Color('#9AA1AC');

  static const background = Color('#FFFFFF');
  static const surface = Color('#FBFCFD'); // section bg, highlight/contact tints
  static const surfaceSunken = Color('#F2F4F7'); // chips
  static const navHover = Color('#F4F6F8');

  static const border = Color('#E3E6EA'); // cards, contact, chips-as-buttons
  static const borderSoft = Color('#ECEFF2'); // nav / section dividers
  static const borderFaint = Color('#EEF1F4'); // highlight cards, hero divider
  static const borderStrong = Color('#DCE0E5'); // ghost button
  static const borderStrongHover = Color('#C7CDD4');

  static const chipBg = Color('#F2F4F7');
  static const chipTextStrong = Color('#16181D'); // skill chips
  static const chipTextMuted = Color('#5B6470'); // tech tags

  // Blue accent surfaces (badge, impact, role badge, strength chips).
  static const blueBg = Color('#F1F5FA');
  static const blueBorder = Color('#DCE7F2');
  static const blueChipBorder = Color('#CFDCEA');
  static const countBg = Color('#EAF1F8');

  static const success = Color('#2E8C5A'); // open-to-work dot

  static const headerBg = Color('rgba(255, 255, 255, 0.82)');
  static const overlay = Color('rgba(16, 24, 40, 0.42)');
  static const white = Color('#FFFFFF');
}

abstract final class AppFonts {
  // Latin-first stack; Korean falls through to Pretendard (matches design body).
  static const sans = FontFamily.list([
    FontFamily('Inter'),
    FontFamily('Pretendard'),
    FontFamilies.systemUi,
    FontFamilies.sansSerif,
  ]);
  static const mono = FontFamily.list([
    FontFamily('JetBrains Mono'),
    FontFamilies.monospace,
  ]);
}

/// Font sizes in px (design uses px / clamp). Use as `AppType.body.px`.
abstract final class AppType {
  static const double h1 = 52;
  static const double h2 = 30;
  static const double h3 = 27;
  static const double lead = 21;
  static const double body = 16;
  static const double small = 14;
  static const double tiny = 13;
  static const double label = 11; // mono micro-labels
  static const double labelSm = 10;
}

/// Spacing scale in px.
abstract final class AppSpacing {
  static const double xs = 4;
  static const double s = 8;
  static const double m = 16;
  static const double l = 24;
  static const double xl = 40;
  static const double xxl = 96;
}

/// Border radius in px (Modern tone — tight).
abstract final class AppRadius {
  static const double xs = 4;
  static const double s = 6;
  static const double card = 9;
  static const double panel = 12;
  static const double chip = 6;
  static const double full = 999;
}

abstract final class AppLayout {
  static const double maxWidth = 1120;
}

abstract final class AppBreakpoints {
  static const int mobile = 767;
  static const int tablet = 1023;
}
