/// The entrypoint for the **server** environment (pre-rendering).
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'design/theme.dart';
import 'main.server.options.dart';

const _siteTitle = '심진웅 · Mobile App Developer 포트폴리오';
const _siteDescription =
    '15년차 모바일 앱 개발자 심진웅의 포트폴리오. AI 스마트글래스 앱·Client SDK, '
    'Flutter/Dart, Android·iOS 네이티브, Qt/QML 기반의 대표 프로젝트를 소개합니다.';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(Document(
    title: _siteTitle,
    lang: 'ko',
    // Production target is the GitHub Pages project site (/portfolio/), so the
    // base defaults to that — CI needs no extra flags. Jaspr requires an
    // absolute base (it normalizes './' back to root). For local dev the
    // launch config overrides this with --dart-define=BASE_HREF=/.
    base: const String.fromEnvironment('BASE_HREF', defaultValue: '/portfolio/'),
    viewport: 'width=device-width, initial-scale=1.0',
    meta: {
      'description': _siteDescription,
      'author': 'Sim Jin woong (심진웅)',
      'theme-color': '#2E5A8C',
    },
    styles: [
      // Web fonts: Pretendard (KR) + Inter / JetBrains Mono (EN/mono).
      css.import(
          'https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.min.css'),
      css.import(
          'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=JetBrains+Mono&display=swap'),
      ...globalStyles,
    ],
    head: [
      link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
      link(
          rel: 'preconnect',
          href: 'https://fonts.gstatic.com',
          attributes: {'crossorigin': ''}),
      // Open Graph / social cards.
      meta(attributes: {'property': 'og:type', 'content': 'website'}),
      meta(attributes: {'property': 'og:title', 'content': _siteTitle}),
      meta(attributes: {'property': 'og:description', 'content': _siteDescription}),
      meta(attributes: {'name': 'twitter:card', 'content': 'summary_large_image'}),
    ],
    body: const App(),
  ));
}
