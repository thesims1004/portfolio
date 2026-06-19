import 'project.dart';

/// Project catalogue — all 24 projects. Descriptions and the "주요 개발 내용"
/// (highlights) are taken from the owner's portfolio document; tech stacks,
/// links, periods and screenshots are verified per project.
const List<Project> projects = [
  // ── Seerslab ──────────────────────────────────────────────────────────
  Project(
    id: 'ainoon',
    screenshots: [
      'images/projects/ainoon-1.jpg',
      'images/projects/ainoon-2.jpg',
      'images/projects/ainoon-3.jpg',
      'images/projects/ainoon-4.jpg',
      'images/projects/ainoon-5.jpg',
    ],
    name: 'AInoon',
    category: ProjectCategory.seerslab,
    org: 'Seerslab',
    period: '2025.05 ~ 현재',
    role: '단독 개발',
    oneLiner: 'Android OS 기반 AI 스마트 글래스 — 컴패니언 앱·Client SDK 단독 개발',
    description:
        '마이크·이어폰·카메라가 탑재된 안드로이드 OS 기반의 AI 스마트 글래스. 하드웨어 개발 초기 '
        '단계부터 2025년 12월 출시까지 약 8개월간 컴패니언 앱·Client SDK·글래스 탑재 AI 서비스 '
        '앱(온디바이스 Android Java)까지 모바일 영역 전반을 단독 책임했습니다. 중국 하드웨어 '
        '제조사가 제공한 네이티브 SDK를 직접 검증·개선 요청하며 Flutter Plugin으로 래핑했고, '
        'BLE·Bluetooth·Wi-Fi 핫스팟·Wi-Fi P2P 등 다양한 통신 방식을 하나의 SDK 인터페이스로 '
        '통합했습니다.',
    highlights: [
      '컴패니언 앱(Flutter): Clean Architecture 기반 설계 — Bloc(상태관리)+Freezed(불변 모델)+GetIt(DI)로 레이어 분리·테스트 용이성 확보',
      'Client SDK(Flutter Plugin): 제조사의 Android(Java/Kotlin)·iOS(Swift) 네이티브 SDK를 Flutter Plugin으로 래핑, 제조사와 직접 SDK 테스트·버그 리포트·API 개선 요청 진행',
      '디바이스 통신: BLE 연결·Bluetooth Pairing(Classic)·Wi-Fi 핫스팟 연결 앱 연동',
      '글래스 탑재 AI 서비스 앱(Android Java): 기존 담당자 퇴사 후 인계받아 유지보수·신규 기능 개발',
      '온디바이스 AI 대화 기능(VAD·STT·TTS 파이프라인 통합)',
      '실시간 통역 및 WebRTC·RTMP 기반 라이브 방송 기능 개발',
    ],
    impact:
        '2025년 12월 Google Play·App Store 출시. 2026년 4월 국내 유명 엔터테인먼트 기업 대상 '
        '시연 진행(전용 디자인 + 라이브 방송 + 실시간 통역 데모). 아티스트용 커스텀 글래스·앱 협업 협의 중.',
    techStack: [
      'Flutter / Dart',
      'Android Java',
      'iOS Swift',
      'Bloc · Freezed · GetIt',
      'BLE · Bluetooth',
      'WebRTC · RTMP',
    ],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.seerslab.ainoon'),
      ProjectLink('App Store', 'https://apps.apple.com/app/id6743101845'),
      ProjectLink('관련 기사',
          'https://www.unicornfactory.co.kr/article/2026040907263342209'),
    ],
  ),
  Project(
    id: 'ainoonx',
    screenshots: [
      'images/projects/ainoonx-1.jpg',
      'images/projects/ainoonx-2.jpg',
      'images/projects/ainoonx-3.jpg',
      'images/projects/ainoonx-4.jpg',
    ],
    name: 'AInoonX',
    category: ProjectCategory.seerslab,
    org: 'Seerslab',
    period: '2026.01',
    role: '단독 개발',
    oneLiner: 'AI 오디오 글래스 Client SDK 단독 개발 — 1~2주 내 신속 통합',
    description:
        '오디오 폼팩터의 두 번째 스마트 글래스 제품. SDK 영역을 단독으로 담당하여 약 1~2주 내 '
        '신속하게 통합을 완료했습니다.',
    highlights: [
      '중국 제조사의 Android(Java/Kotlin)·iOS(Swift) 네이티브 SDK를 Flutter Plugin으로 래핑',
      'BLE 연결·Bluetooth 페어링 연결 구현',
      'AInoon에서 검증된 SDK 구조를 재사용하여 단기간 내 통합 완료',
    ],
    impact: '검증된 SDK 구조 재사용으로 신규 디바이스 대응 기간을 1~2주로 단축.',
    techStack: ['Flutter Plugin', 'Android Java', 'iOS Swift', 'BLE', 'Bluetooth Pairing'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.seerslab.ainoonx'),
      ProjectLink('App Store', 'https://apps.apple.com/app/id6757424948'),
    ],
  ),

  // ── Renasoftware · Mobile ─────────────────────────────────────────────
  Project(
    id: 'snapmovie',
    screenshots: ['images/projects/snapmovie-1.jpg', 'images/projects/snapmovie-2.jpg'],
    name: '스냅무비',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2013.11 ~ 2014.02',
    role: '단독 개발',
    oneLiner: 'FFmpeg를 NDK로 직접 빌드한 영상 편집 앱 — 누적 500만 다운로드',
    description:
        '짧은 영상 클립을 모아 필터·BGM을 입혀 인코딩해주는 안드로이드 앱. 안드로이드 영상 처리 '
        '라이브러리 환경이 미흡하던 시기에 FFmpeg C++ 코드를 NDK로 직접 빌드해 프레임 단위 이미지 '
        '처리와 음원 결합 인코딩을 자체 구현했습니다. 출시 후 2014년 사진 앱 1위, 누적 500만 '
        '다운로드를 기록한 자체 서비스로, 기획·개발·스토어 출시·운영까지 단독으로 진행했습니다.',
    highlights: [
      'FFmpeg C++ 코드를 NDK로 직접 빌드, 프레임 단위 이미지 처리 후 음원과 결합해 영상으로 인코딩하는 핵심 기능 개발',
      '짧은 영상을 촬영·취합하여 필터·BGM을 입혀 인코딩하는 앱 개발',
      '앱 단독 개발 및 스토어 출시·관리',
    ],
    impact: '2014년 사진 앱 1위, 누적 500만 다운로드 달성.',
    techStack: ['Android Native (Java)', 'FFmpeg', 'JNI / NDK'],
    links: [
      ProjectLink('관련 기사', 'https://news.mt.co.kr/mtview.php?no=2014052218507481545'),
    ],
  ),
  Project(
    id: 'hamsoa-shes',
    screenshots: ['images/projects/hamsoa-shes-1.jpg', 'images/projects/hamsoa-shes-2.jpg'],
    name: '함소아·쉬즈한의원',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2014 ~ 현재',
    role: '단독 개발',
    oneLiner: '가입자 20만, 10년+ 운영 — 앱부터 PHP 서버·인프라까지 단독',
    description:
        '함소아·쉬즈한의원의 환자용 모바일 서비스. 처음에는 앱만 단독 개발했으나, 서버 개발자 퇴사 '
        '이후 PHP REST API 서버·HTML 웹 관리자·MySQL DB까지 인계받아 10년 이상 유지보수·리뉴얼을 '
        '단독 진행했습니다. 인프라 영역에서도 서버 이전을 단순화하기 위해 Ubuntu+Apache+PHP를 '
        'Docker 이미지로 빌드해 OS 의존성을 줄였고, FCM 레거시 API deprecated 이슈에는 외부 솔루션 '
        '없이 Dart+Docker 기반 별도 푸시 REST API를 자체 구축해 해결했습니다.',
    highlights: [
      '병원 차트·진료 내역 연동, 성장 관리·생리 일정 관리, 한의원 뉴스/이벤트 푸시 알림 앱 개발',
      '앱 단독 개발로 시작, 서버 개발자 퇴사 후 PHP REST API 서버·HTML 웹 관리자·MySQL DB 유지보수·리뉴얼 인계',
      '서버 이전 시 Ubuntu+Apache+PHP를 Docker 이미지로 빌드해 OS 설정 간소화',
      'FCM 레거시 API deprecated 대응을 위해 외부 솔루션 없이 Dart+Docker 기반 별도 푸시 REST API 자체 구축',
    ],
    impact: '함소아 앱 가입자 약 20만 명 규모, 10년+ 라이브 운영.',
    techStack: ['Qt/QML', 'PHP · Apache', 'Docker', 'MySQL', 'Firebase'],
    links: [
      ProjectLink('함소아',
          'https://play.google.com/store/apps/details?id=com.hamsoa.mobile'),
      ProjectLink('쉬즈', 'https://play.google.com/store/apps/details?id=com.shes.mobile'),
    ],
  ),
  Project(
    id: 'study-genius',
    screenshots: [
      'images/projects/study-genius-1.jpg',
      'images/projects/study-genius-2.jpg',
      'images/projects/study-genius-3.jpg',
      'images/projects/study-genius-4.jpg',
    ],
    name: '공부천재',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2024.10 ~ 2025.03',
    role: '공동 개발 (2인)',
    oneLiner: '학습 앱 — 인앱결제 영수증 주기적 재검증, PG 직접 연동',
    description:
        '교재를 구입하거나 자신의 PDF를 불러와 필기·문제풀이·오답 다시풀기, 학습 통계, 커뮤니티 '
        'Q&A까지 제공하는 학습 앱. 인앱 결제 포인트 충전 시 서버에서 Google·Apple API로 영수증 '
        '유효성을 주기적으로 재검증해 환불·취소에 대응하고, 앱 외 웹에서도 결제할 수 있도록 '
        'Nicepay PG를 서버에서 직접 연동했습니다. 앱과 서버를 대표와 2인 공동으로 개발·운영했습니다.',
    highlights: [
      '교재 구입 또는 PDF 불러오기, 필기·문제풀이·오답 다시풀기, 학습 통계, 커뮤니티 Q&A 기능 개발',
      'In-App 결제(포인트 충전), 서버에서 Google·Apple API로 영수증 유효성 주기적 재검증(환불·취소 대응)',
      '앱 외 웹 결제를 위해 Nicepay PG를 서버에서 직접 연동',
      '앱·서버를 대표와 2인 공동 개발·운영',
    ],
    techStack: ['Flutter', 'Dart REST API', 'Docker', 'MySQL'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.rena.smartstudy'),
    ],
  ),
  Project(
    id: 'hk-golf',
    screenshots: [
      'images/projects/hk-golf-1.jpg',
      'images/projects/hk-golf-2.jpg',
      'images/projects/hk-golf-3.jpg',
      'images/projects/hk-golf-4.jpg',
      'images/projects/hk-golf-5.jpg',
    ],
    name: '한케이골프',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2024.11',
    role: '단독 개발',
    oneLiner: 'Flutter+WebView 쇼핑몰 앱 — 한 달 안에 양 플랫폼 출시',
    description:
        '한케이골프 골프 쇼핑몰의 공식 모바일 앱. Flutter + WebView 구조로 쇼핑몰 웹을 표시하면서, '
        '외부 은행·카드 앱 호출 기반의 결제, FCM 푸시 통합 등 네이티브 처리가 필요한 영역만 분리해 '
        '구현했습니다. 디자인 적용·결제 흐름 검증을 거쳐 한 달 안에 Android·iOS 양 플랫폼 출시까지 '
        '완료했습니다. (서버·웹은 다른 업체)',
    highlights: [
      '외부 은행·카드 앱 호출 기반 결제 흐름 처리, 결제 결과 콜백 처리',
      'FCM 푸시 통합 및 알림 권한·딥링크 라우팅 구현',
      '디자인 적용·결제 흐름 검증을 거쳐 한 달 안에 Android·iOS 양 플랫폼 출시',
    ],
    impact: '디자인 적용 후 한 달 내 양 플랫폼 동시 출시.',
    techStack: ['Flutter', 'WebView', 'FCM', 'Deep Links'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.hnk.app.hankgolf'),
      ProjectLink('App Store', 'https://apps.apple.com/kr/app/id6698863208'),
    ],
  ),
  Project(
    id: 'golpai',
    screenshots: [
      'images/projects/golpai-1.jpg',
      'images/projects/golpai-2.jpg',
      'images/projects/golpai-3.jpg',
      'images/projects/golpai-4.jpg',
      'images/projects/golpai-5.jpg',
      'images/projects/golpai-6.jpg',
    ],
    name: '골파이 온라인레슨',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2023.11 ~ 2024.04',
    role: '앱 80% · 서버 단독',
    oneLiner: '골프 자세 분석·1:1 레슨 — MQTT 실시간 채팅 도입',
    description:
        '골프 자세를 동영상으로 촬영해 분석하고, 프로 골퍼와 채팅으로 1:1 레슨을 받는 앱. 자세 '
        '분석은 발주사(스크린Go)에서 PyTorch 기반 네이티브 코드로 제공했고, 본인은 앱·서버 통합과 '
        '채팅·이벤트 영역을 책임했습니다. 단순 푸시 방식으로는 부족한 실시간 채팅 요구사항을 위해 '
        '앱·서버에 MQTT를 도입했고, 인앱 결제 + Google/Apple API 결제 유효성 재검증, 프로 골퍼 '
        '수익 환급 로직까지 직접 설계·구현했습니다.',
    highlights: [
      '동영상 골프 자세 촬영·분석, 프로 골퍼와의 유사도 측정, 채팅 기반 레슨, 프로 골퍼 수익 환급 기능 개발',
      '자세 분석은 발주사(스크린Go)가 PyTorch 기반 Java/Objective-C 네이티브로 제공',
      '실시간 채팅 요구사항을 위해 앱·서버에 MQTT 도입',
      'In-App 결제 + 서버 측 Google/Apple API 결제 유효성 검증, 프로 골퍼 수익 환급 로직 직접 설계·구현',
    ],
    techStack: ['Flutter', 'Dart REST API', 'Docker', 'MySQL', 'MQTT'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.screengo.golfai'),
    ],
  ),
  Project(
    id: 'bandai-namco',
    screenshots: [
      'images/projects/bandai-namco-1.jpg',
      'images/projects/bandai-namco-2.jpg',
      'images/projects/bandai-namco-3.jpg',
    ],
    name: '반다이남코코리아',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2021.06 ~ 2021.08',
    role: '앱 단독',
    oneLiner: '멤버십 앱 + 쇼핑몰 웹앱 각각 단독 개발',
    description: '반다이남코코리아의 멤버십 앱과 쇼핑몰 웹앱(WebView)을 각각 개발했습니다.',
    highlights: [
      '앱 단독 개발·스토어 출시·관리 (서버·쇼핑몰 웹은 다른 업체)',
      '쇼핑몰 웹앱은 WebView 기반, 카드/은행 결제 처리 부분만 네이티브 코드로 처리',
    ],
    techStack: ['Flutter', 'WebView'],
    links: [
      ProjectLink('멤버십',
          'https://play.google.com/store/apps/details?id=com.bnkr.member'),
      ProjectLink('몰', 'https://play.google.com/store/apps/details?id=com.bnkr.mall'),
    ],
  ),
  Project(
    id: 'platform-place',
    screenshots: [
      'images/projects/platform-place-1.jpg',
      'images/projects/platform-place-2.jpg',
      'images/projects/platform-place-3.jpg',
      'images/projects/platform-place-4.jpg',
    ],
    name: '플랫폼플레이스 외',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2021 ~ 현재',
    role: '앱 단독',
    oneLiner: '다수 패션 브랜드 멀티앱 — 동일 코드 기반 분기 운영',
    description:
        '동일 업체에서 운영하는 다수 패션·라이프스타일 브랜드(플랫폼플레이스·테바코리아·세인트제임스 '
        '등)의 공식 모바일 앱. Flutter + WebView 구조로 쇼핑몰 웹을 표시하고, 외부 은행·카드 앱 '
        '호출 기반 결제, FCM 푸시, 스토어 출시·심사 대응 등 네이티브 처리가 필요한 영역만 분리해 '
        '직접 구현했습니다. 2021년 출시 이후 현재까지 동일 코드 기반을 확장·유지보수하며 다수 '
        '브랜드 앱을 동일 구조로 운영 중입니다.',
    highlights: [
      '국내 주요 은행·카드 앱과의 결제 호출 흐름 처리, 결제 결과 콜백·예외 처리',
      'FCM 푸시 통합, 푸시 권한·딥링크 라우팅, 마케팅·운영 푸시 시나리오 대응',
      '동일 코드 기반에서 브랜드별 디자인·설정·도메인을 분기해 다수 앱을 효율적으로 운영 (서버·웹은 다른 업체)',
    ],
    techStack: ['Flutter', 'WebView', 'FCM', 'Deep Links'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=kr.co.platformshop.mobile'),
      ProjectLink('App Store', 'https://apps.apple.com/kr/app/id1578418155'),
    ],
  ),
  Project(
    id: 'kingkoil-berex',
    screenshots: [
      'images/projects/kingkoil-berex-1.jpg',
      'images/projects/kingkoil-berex-2.jpg',
      'images/projects/kingkoil-berex-3.jpg',
      'images/projects/kingkoil-berex-4.jpg',
      'images/projects/kingkoil-berex-5.jpg',
    ],
    name: 'King Koil · BEREX 스마트매트리스',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2019 ~ 2024.09',
    role: '단독 개발',
    oneLiner: 'BLE 멀티 브랜드 매트리스 앱 — Qt→Flutter 재개발',
    description:
        'iOBED 매트리스 리모컨 앱으로 시작해, 동일 하드웨어를 OEM으로 사용하는 King Koil·코웨이 '
        'BEREX 브랜드 앱으로 추가 출시한 멀티 브랜드 프로젝트. BLE를 통해 매트리스 기기와 양방향 '
        '통신하며 경도 조절·수면 측정·리포트 기능을 제공합니다. Qt/QML로 안드로이드·iOS 양 '
        '플랫폼을 동시에 단독 개발한 뒤, 이후 Flutter로 한 번 더 재개발하며 두 차례의 기술 '
        '마이그레이션을 단독으로 수행했습니다.',
    highlights: [
      'iOBED 매트리스 리모컨 앱으로 시작, 동일 하드웨어를 OEM으로 쓰는 King Koil·코웨이 BEREX 브랜드 앱으로 확장',
      'BLE로 매트리스 기기와 양방향 통신 — 경도 조절·수면 측정·리포트 기능 제공',
      'Qt/QML로 Android·iOS 동시 단독 개발 후 Flutter로 재개발, 두 차례 기술 마이그레이션 단독 수행',
      '코웨이 BEREX는 이후 코웨이 IoT 앱에 통합되어 서비스 종료',
    ],
    techStack: ['Qt/QML → Flutter', 'BLE'],
    links: [
      ProjectLink('개발사 앱', 'https://play.google.com/store/apps/developer?id=iOBED'),
    ],
  ),
  Project(
    id: 'serajeum-iot',
    screenshots: [
      'images/projects/serajeum-iot-1.jpg',
      'images/projects/serajeum-iot-2.jpg',
      'images/projects/serajeum-iot-3.jpg',
      'images/projects/serajeum-iot-4.jpg',
      'images/projects/serajeum-iot-5.jpg',
      'images/projects/serajeum-iot-6.jpg',
    ],
    name: '세라젬 IoT',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2019 ~ 2021',
    role: '앱·서버 단독',
    oneLiner: '안마베드 리모컨 — MQTT 양방향 프로토콜, Qt/C++ 서버',
    description:
        '세라젬 안마베드의 모바일 리모컨 + 컨텐츠/이벤트 앱. 베드 기기와 MQTT 위에 JSON 포맷의 '
        '양방향 프로토콜을 정의해 동작 제어와 상태 수신을 구현했고, 앱과 서버를 단독으로 책임했습니다. '
        'REST API 서버는 Qt/C++로 직접 구현해 Docker로 배포했습니다(관리자 웹은 다른 개발자 담당).',
    highlights: [
      '세라젬 안마베드 리모컨 기능 및 컨텐츠/이벤트 제공 앱 개발',
      '베드 기기와 MQTT 위 JSON 양방향 프로토콜을 정의해 동작 제어·상태 수신 구현',
      'REST API 서버를 Qt/C++로 직접 구현해 Docker로 배포 (관리자 웹은 다른 개발자)',
    ],
    techStack: ['Qt/QML', 'Qt/C++ REST API', 'Docker', 'MySQL', 'MQTT'],
  ),
  Project(
    id: 'focus-timer',
    screenshots: ['images/projects/focus-timer-1.jpg'],
    name: '방치의 신',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2017 ~ 현재',
    role: '단독 개발',
    oneLiner: '스마트폰 미사용 시간 보상 앱 — 8년+ 운영, 서버까지 인계',
    description:
        '스마트폰을 덮어두고 사용하지 않는 시간을 측정해 그 시간만큼 포인트로 보상하는 자체 출시 앱. '
        '추가 적립을 위한 오퍼월·자체 광고 시스템과 미탭스플러스 기프티콘 스토어 연동까지 직접 '
        '통합해 보상 사이클을 완성했습니다. 처음에는 앱만 단독 개발했으나, 서버 개발자 퇴사 후 '
        'Node.js REST API + Docker + MySQL DB까지 인계받아 8년 이상 운영하고 있습니다.',
    highlights: [
      '스마트폰 미사용(덮어두기) 시간을 측정해 포인트 보상, 오퍼월 추가 적립, 미탭스플러스 기프티콘 스토어 연동(포인트→기프티콘 구매)',
      '앱 단독 개발로 시작, 서버 개발자 퇴사 후 Node.js REST API + Docker + MySQL DB 인계·유지보수',
    ],
    impact: '2017년 출시 이후 8년+ 운영.',
    techStack: ['Qt/QML', 'Node.js REST API', 'Docker', 'MySQL'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.rena.focustimer'),
    ],
  ),
  Project(
    id: 'ls-plc',
    screenshots: [
      'images/projects/ls-plc-1.jpg',
      'images/projects/ls-plc-2.jpg',
      'images/projects/ls-plc-3.jpg',
      'images/projects/ls-plc-4.jpg',
      'images/projects/ls-plc-5.jpg',
    ],
    name: 'LS산전 XGT-PLC',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2017',
    role: '신규 개발',
    oneLiner: 'PLC 통신 앱 — USB·RS232·Bluetooth·TCP 4종 통합 지원',
    description:
        'LS산전의 PLC(산업용 자동화 컨트롤러) 기기와 모바일을 연결해 모니터링·데이터 읽기/쓰기를 '
        '수행하는 앱. 기존 안드로이드 네이티브 앱의 일부 기능과 C++ 기반 윈도우 프로그램의 통신 '
        '코드를 분석해, 핵심 프로토콜 로직을 모바일(Android·iOS) 환경으로 직접 포팅했습니다. 한 앱 '
        '안에서 USB·RS232 시리얼·Bluetooth·Wi-Fi TCP 소켓 등 4가지 통신 방식을 모두 통합 '
        '지원하도록 구현했습니다.',
    highlights: [
      '기존 Android Native 앱 일부 기능 + C++ 기반 윈도우 프로그램 통신 코드를 분석해 핵심 프로토콜을 모바일로 직접 포팅',
      '한 앱에서 USB·RS232 시리얼·Bluetooth·Wi-Fi TCP 소켓 등 4가지 통신 방식 통합 지원 구현',
    ],
    techStack: ['Qt/QML', 'Android Native (Java)', 'iOS Native (Obj-C)'],
  ),
  Project(
    id: 'mobile-stock',
    screenshots: [
      'images/projects/mobile-stock-1.jpg',
      'images/projects/mobile-stock-2.jpg',
      'images/projects/mobile-stock-3.jpg',
      'images/projects/mobile-stock-4.jpg',
      'images/projects/mobile-stock-5.jpg',
      'images/projects/mobile-stock-6.jpg',
    ],
    name: '모바일주식회사 1·2',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2015',
    role: '앱 단독',
    oneLiner: '오퍼월 광고 기반 리워드 적립 앱 2종 — 리워드 라인의 출발점',
    description:
        '외주로 개발한 오퍼월 광고 기반 리워드 적립 안드로이드 앱 두 종(모바일주식회사 1·2). 광고 '
        '시청·미션 수행으로 포인트를 적립하고 기프티콘으로 교환할 수 있는 보상 구조입니다. Android '
        'Native(Java) 단독 개발이며, 서버는 외부 개발자가 담당했습니다. 이후 진행한 착한동전'
        '(2016~), 방치의 신(2017~)과 같은 리워드 앱 라인의 출발점 프로젝트입니다.',
    highlights: [
      '오퍼월 SDK 통합 및 광고 보상 흐름 처리',
      '포인트 적립·소진 흐름과 기프티콘 교환 화면 구현 (서버는 외부 개발자)',
      '이후 착한동전·방치의 신으로 이어지는 리워드 앱 라인의 출발점',
    ],
    techStack: ['Android Native (Java)'],
  ),
  Project(
    id: 'musicon',
    screenshots: [
      'images/projects/musicon-1.jpg',
      'images/projects/musicon-2.jpg',
      'images/projects/musicon-3.jpg',
    ],
    name: '뮤직온',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2013',
    role: '앱 단독',
    oneLiner: 'YouTube 기반 음악 차트/플레이어 — 누적 100만 다운로드',
    description:
        'YouTube 기반 음악 차트/플레이어 안드로이드 앱 — 차트, 나의 앨범(플레이리스트), 영상 재생, '
        '백그라운드 음원 재생 기능을 1~2개월간 단독 개발했습니다.',
    highlights: [
      '차트·나의 앨범(플레이리스트)·영상 재생·백그라운드 음원 재생 기능 개발',
      '1~2개월간 앱 단독 개발 (서버는 다른 개발자)',
    ],
    impact: '2013년 누적 100만 다운로드 달성.',
    techStack: ['Android Native (Java)'],
  ),

  // ── Renasoftware · Desktop ────────────────────────────────────────────
  Project(
    id: 'ablemax-optaq',
    screenshots: [
      'images/projects/ablemax-optaq-1.jpg',
      'images/projects/ablemax-optaq-2.jpg',
      'images/projects/ablemax-optaq-3.jpg',
    ],
    name: 'ableMAX OptaQ',
    category: ProjectCategory.renasoftwareDesktop,
    org: 'Renasoftware · Desktop',
    period: '2019',
    role: '공동 개발',
    oneLiner: '빅데이터 기반 AI 예측 모델 생성·검증 데스크톱 프로그램',
    description:
        '빅데이터 기반 AI 예측 모델 생성·검증, 다양한 차트/그래프 표시, 데이터 Import/Export가 '
        '가능한 데스크톱 프로그램입니다.',
    highlights: [
      '머신러닝 알고리즘·모델 생성/예측은 ableMAX 측 Python 라이브러리로 제공, 그 외 프로그램 영역을 2인 공동 개발',
    ],
    techStack: ['Qt/QML', 'C++'],
    links: [ProjectLink('관련 링크', 'https://www.ablemax.co.kr/90')],
  ),
  Project(
    id: 'etri-cps',
    screenshots: [
      'images/projects/etri-cps-1.jpg',
      'images/projects/etri-cps-2.jpg',
      'images/projects/etri-cps-3.jpg',
    ],
    name: 'ETRI CPS Visualizer',
    category: ProjectCategory.renasoftwareDesktop,
    org: 'Renasoftware · Desktop',
    period: '2011',
    role: '공동 개발',
    oneLiner: '국방 CPS(사이버물리시스템) 3D 실시간 시각화',
    description:
        'ETRI(한국전자통신연구원)에서 개발한 CPS(사이버물리시스템, 국방무기체계 통합 통신 SW)를 '
        '3D로 실시간 시각화하기 위해 2012년 개발한 프로그램입니다.',
    highlights: [
      'Ogre 3D·C++·MFC 기반 3D 실시간 시각화, 2인 공동 개발',
    ],
    techStack: ['Ogre 3D', 'C++', 'MFC'],
    links: [
      ProjectLink('관련 영상', 'https://www.youtube.com/watch?v=qVxigVszOn4'),
    ],
  ),

  // ── 개인·외주 ─────────────────────────────────────────────────────────
  Project(
    id: 'goodcoin',
    screenshots: [
      'images/projects/goodcoin-1.jpg',
      'images/projects/goodcoin-2.jpg',
      'images/projects/goodcoin-3.jpg',
      'images/projects/goodcoin-4.jpg',
      'images/projects/goodcoin-5.jpg',
    ],
    name: '착한동전',
    category: ProjectCategory.personalCommissioned,
    org: '의뢰 외주',
    period: '2016 ~ 현재',
    role: '앱 단독',
    oneLiner: '포인트 적립·기프티콘 리워드 앱 — 9년+ 라이브 유지보수',
    description:
        '포인트 충전소(오퍼월)·자체 광고·이벤트로 포인트를 적립하고, 적립된 포인트로 기프티콘을 '
        '구매할 수 있는 리워드 앱. 회원 간 소통이 가능한 커뮤니티 기능을 포함합니다. 2016년 출시 '
        '이후 9년+ 라이브 서비스 유지보수를 진행하고 있습니다.',
    highlights: [
      '포인트 충전소(오퍼월)·자체 광고·이벤트로 포인트 적립 → 기프티콘 구매, 회원 커뮤니티 기능 포함',
      '9년+ 장기 운영 중인 의뢰 외주 앱 — 안정적 유지보수·점진적 기능 개선 (서버는 다른 개발자)',
    ],
    impact: '2016년 출시 이후 9년+ 라이브 운영.',
    techStack: ['Qt/QML'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=kr.jknet.goodcoin'),
    ],
  ),
  Project(
    id: 'pica',
    screenshots: [
      'images/projects/pica-1.jpg',
      'images/projects/pica-2.jpg',
      'images/projects/pica-3.jpg',
      'images/projects/pica-4.jpg',
    ],
    name: 'PICA',
    category: ProjectCategory.personalCommissioned,
    org: '개인 출시',
    period: '2021.04 ~ 현재',
    role: '기획·개발·디자인·출시 단독',
    oneLiner: 'libraw를 NDK로 직접 빌드한 RAW 사진 편집 앱 — 개인 기획·출시',
    description:
        '당시 무료 RAW 이미지 편집 앱이 거의 부재했던 시장 상황에 착안해 직접 기획·개발한 사진 편집 '
        '앱. 유료 솔루션을 사용하는 대신 오픈소스 libraw를 NDK로 직접 빌드해 RAW 편집 기능을 자체 '
        '구현했고, GPUImage와 LUT image 기반의 효과·필터, 인앱 구독 결제까지 단독으로 설계·'
        '구현했습니다. 출시 4년차에도 누적 1만+ 다운로드, 활성 사용자 약 700+를 유지하며 운영 '
        '중이며, 현재 Flutter로 재개발하면서 iOS 출시를 준비하고 있습니다.',
    highlights: [
      '유료 솔루션 대신 오픈소스 libraw를 NDK로 직접 빌드해 RAW 이미지 편집 기능 자체 구현',
      'GPUImage + LUT image 기반 다양한 효과·필터 적용',
      '인앱 구독 결제 기능 구현',
      '기획·개발·디자인·출시·유지보수 단독 진행',
    ],
    impact: '누적 다운로드 1만+, 활성 사용자 약 700+. 현재 Flutter로 재개발 중이며 iOS 출시 준비 중.',
    techStack: ['Android Native (Java)', 'GPUImage', 'LUT', 'libraw (NDK)', 'In-App'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.ssgz.pica'),
    ],
  ),

  // ── 사이드 (AI 바이브코딩) ────────────────────────────────────────────
  // AI 코딩 도구(Claude)를 활용해 단독 개발·출시한 com.ssgz.* 앱들.
  Project(
    id: 'paletton',
    screenshots: [
      'images/projects/paletton-1.jpg',
      'images/projects/paletton-2.jpg',
      'images/projects/paletton-3.jpg',
      'images/projects/paletton-4.jpg',
      'images/projects/paletton-5.jpg',
    ],
    name: 'Paletton',
    category: ProjectCategory.side,
    org: 'Side · AI 바이브코딩',
    period: '2025',
    role: '단독 개발',
    oneLiner: '컬러 팔레트 생성·추출 도구 — AI 바이브코딩으로 개발',
    description:
        'AI 코딩 도구(Claude)를 적극 활용해 짧은 기간에 단독으로 기획·개발·출시한 컬러 팔레트 도구. '
        '색 조합 생성과 이미지에서의 컬러 추출을 지원합니다.',
    highlights: [
      '컬러 팔레트 생성 및 이미지 기반 컬러 추출 기능',
      'AI 코딩 도구를 활용한 기획·개발·출시 단독 진행',
    ],
    techStack: ['Flutter', 'AI 코딩'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.ssgz.paletton'),
    ],
  ),
  Project(
    id: 'runup',
    screenshots: [
      'images/projects/runup-1.jpg',
      'images/projects/runup-2.jpg',
      'images/projects/runup-3.jpg',
      'images/projects/runup-4.jpg',
    ],
    name: 'RunUp',
    category: ProjectCategory.side,
    org: 'Side · AI 바이브코딩',
    period: '2025',
    role: '단독 개발',
    oneLiner: '러닝·하이킹·라이딩 GPS 트래킹 앱 — AI 바이브코딩으로 개발',
    description:
        'AI 코딩 도구(Claude)로 단독 개발·출시한 운동 트래킹 앱. GPS 기반으로 러닝·하이킹·라이딩의 '
        '경로와 활동 기록을 제공합니다.',
    highlights: [
      'GPS 기반 러닝·하이킹·라이딩 경로·활동 기록 기능',
      'AI 코딩 도구를 활용한 기획·개발·출시 단독 진행',
    ],
    techStack: ['Flutter', 'GPS', 'AI 코딩'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.ssgz.runup'),
    ],
  ),
  Project(
    id: 'lottolab',
    screenshots: [
      'images/projects/lottolab-1.jpg',
      'images/projects/lottolab-2.jpg',
      'images/projects/lottolab-3.jpg',
      'images/projects/lottolab-4.jpg',
    ],
    name: '로또연구실',
    category: ProjectCategory.side,
    org: 'Side · AI 바이브코딩',
    period: '2025',
    role: '단독 개발',
    oneLiner: 'QR 당첨확인·번호 분석 로또 도구 — AI 바이브코딩으로 개발',
    description:
        'AI 코딩 도구(Claude)로 단독 개발·출시한 로또 도구. QR 스캔으로 당첨을 확인하고 번호를 '
        '분석합니다.',
    highlights: [
      'QR 스캔 당첨 확인 및 번호 분석 기능',
      'AI 코딩 도구를 활용한 기획·개발·출시 단독 진행',
    ],
    techStack: ['Flutter', 'AI 코딩'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.ssgz.lottolab'),
    ],
  ),
  Project(
    id: 'oneul',
    screenshots: [
      'images/projects/oneul-1.jpg',
      'images/projects/oneul-2.jpg',
      'images/projects/oneul-3.jpg',
      'images/projects/oneul-4.jpg',
      'images/projects/oneul-5.jpg',
    ],
    name: '오늘은',
    category: ProjectCategory.side,
    org: 'Side · AI 바이브코딩',
    period: '2025',
    role: '단독 개발',
    oneLiner: '사주·타로·운세 앱 — AI 바이브코딩으로 개발',
    description:
        'AI 코딩 도구(Claude)로 단독 개발·출시한 운세 앱. 사주·타로·운세 콘텐츠를 제공합니다.',
    highlights: [
      '사주·타로·운세 콘텐츠 제공',
      'AI 코딩 도구를 활용한 기획·개발·출시 단독 진행',
    ],
    techStack: ['Flutter', 'AI 코딩'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.ssgz.oneul'),
    ],
  ),
  Project(
    id: 'vintageshot',
    screenshots: [
      'images/projects/vintageshot-1.jpg',
      'images/projects/vintageshot-2.jpg',
      'images/projects/vintageshot-3.jpg',
      'images/projects/vintageshot-4.jpg',
    ],
    name: 'VintageShot',
    category: ProjectCategory.side,
    org: 'Side · AI 바이브코딩',
    period: '2025',
    role: '단독 개발',
    oneLiner: '필름 감성 카메라 앱 — AI 바이브코딩으로 개발',
    description:
        'AI 코딩 도구(Claude)로 단독 개발·출시한 카메라 앱. 필름 카메라 감성의 촬영 경험을 '
        '제공합니다.',
    highlights: [
      '필름 카메라 감성의 촬영 경험 제공',
      'AI 코딩 도구를 활용한 기획·개발·출시 단독 진행',
    ],
    techStack: ['Flutter', 'Camera', 'AI 코딩'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.ssgz.vintageshot'),
    ],
  ),
];
