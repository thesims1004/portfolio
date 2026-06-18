import 'project.dart';

/// Project catalogue — all 21 projects, sourced from the résumé / portfolio
/// (docx) and matched to the Claude Design copy/style.
const List<Project> projects = [
  // ── Seerslab ──────────────────────────────────────────────────────────
  Project(
    id: 'ainoon',
    name: 'AInoon',
    category: ProjectCategory.seerslab,
    org: 'Seerslab',
    period: '2025.05 ~ 현재',
    role: '단독 개발',
    oneLiner: 'Android OS 기반 AI 스마트 글래스 — 컴패니언 앱·Client SDK 단독 개발',
    description:
        '마이크·이어폰·카메라가 탑재된 Android OS 기반 AI 스마트 글래스. 하드웨어 초기 단계부터 '
        '컴패니언 앱·Client SDK(Flutter Plugin)·온디바이스 AI 서비스 앱까지 모바일 영역 전반을 '
        '약 8개월간 단독 책임했습니다. 중국 제조사 네이티브 SDK를 검증·개선 요청하며 Flutter '
        'Plugin으로 래핑했고, BLE·Bluetooth·Wi-Fi 핫스팟·P2P를 하나의 SDK 인터페이스로 통합. '
        'AI 대화(VAD·STT·TTS), 실시간 통역, WebRTC/RTMP 라이브 방송까지 구현했습니다.',
    impact:
        '2025.12 Google Play / App Store 출시. 2026.04 국내 유명 엔터 기업 대상 라이브 방송·실시간 통역 데모 진행.',
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
    name: 'AInoonX',
    category: ProjectCategory.seerslab,
    org: 'Seerslab',
    period: '2026.01',
    role: '단독 개발',
    oneLiner: 'AI 오디오 글래스 Client SDK 단독 개발 — 1~2주 내 신속 통합',
    description:
        'AInoon에 이어 오디오 폼팩터로 나온 두 번째 스마트 글래스 제품. 검증된 SDK 구조를 재사용해 '
        'Client SDK 통합을 1~2주 만에 단독으로 마무리했습니다. Android·iOS 네이티브 SDK를 Flutter '
        'Plugin으로 래핑하고 BLE 연결과 Bluetooth 페어링을 구현했습니다.',
    impact: '검증된 SDK 구조 재사용으로 신규 디바이스 대응 기간을 1~2주로 단축.',
    techStack: [
      'Flutter Plugin',
      'Android Java',
      'iOS Swift',
      'BLE',
      'Bluetooth Pairing',
    ],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.seerslab.ainoonx'),
      ProjectLink('App Store', 'https://apps.apple.com/app/id6757424948'),
    ],
  ),
  // ── Renasoftware · Mobile ─────────────────────────────────────────────
  Project(
    id: 'snapmovie',
    screenshots: ['images/projects/snapmovie-1.jpg', 'images/projects/snapmovie-2.jpg',],
    name: '스냅무비',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2013.11 – 2014.02',
    role: '단독 개발',
    oneLiner: '단편 영상·필터·BGM 합성 앱 — 2014 사진 앱 1위, 누적 500만 다운로드',
    description:
        'Android 동영상 처리 라이브러리가 부족하던 시기에 FFmpeg C++ 코드를 JNI로 직접 빌드해 '
        '프레임 단위 이미지 처리와 오디오 인코딩을 구현했습니다. 단편 영상에 필터와 배경음악을 '
        '입혀 인코딩하는, 단독 개발한 자체 서비스입니다.',
    impact: '2014년 사진 앱 카테고리 1위, 누적 500만 다운로드.',
    techStack: ['Android Native (Java)', 'FFmpeg', 'JNI'],
    links: [
      ProjectLink('관련 기사',
          'https://news.mt.co.kr/mtview.php?no=2014052218507481545'),
    ],
  ),
  Project(
    id: 'hamsoa-shes',
    screenshots: ['images/projects/hamsoa-shes-1.jpg', 'images/projects/hamsoa-shes-2.jpg',],
    name: "함소아·SHE'S 한의원",
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2014 ~ 현재',
    oneLiner: '한의원 환자용 앱 + PHP/Docker 서버 — 10년+ 운영, 가입자 20만+',
    description:
        '두 한의원의 환자 대상 모바일 서비스. 앱 단독 개발로 시작해 서버 개발자 이탈 후 PHP REST '
        'API 서버·HTML 관리자·MySQL DB까지 인수해 10년 넘게 유지·현대화했습니다. 차트/진료 이력 '
        '연동, 성장 기록, 생리주기 관리, 소식·이벤트 푸시를 제공합니다.',
    impact:
        '함소아 앱 가입자 20만+. Docker 이미지로 서버 이전을 단순화, FCM 레거시 API 폐기를 자체 Dart+Docker 푸시 REST API로 대응.',
    techStack: ['Qt/QML', 'PHP · Apache', 'Docker', 'MySQL', 'Firebase'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.hamsoa.mobile'),
      ProjectLink('Play Store (SHES)',
          'https://play.google.com/store/apps/details?id=com.shes.mobile'),
    ],
  ),
  Project(
    id: 'study-genius',
    screenshots: ['images/projects/study-genius-1.jpg', 'images/projects/study-genius-2.jpg', 'images/projects/study-genius-3.jpg', 'images/projects/study-genius-4.jpg',],
    name: '공부천재',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2024.10 – 2025.03',
    role: '앱+서버 (2인)',
    oneLiner: '교재·PDF 학습 앱 — 인앱결제·PG 연동, 대표와 2인 개발',
    description:
        '구매 교재나 사용자 PDF에 필기·문제풀이·복습·학습 통계·커뮤니티 Q&A를 지원하는 학습 앱. '
        '인앱 포인트는 서버에서 Google/Apple API로 검증하고, 웹 결제를 위해 Nicepay PG를 '
        '연동했습니다. 대표와 앱·서버를 함께 개발·운영했습니다.',
    techStack: ['Flutter', 'Dart REST API', 'Docker', 'MySQL'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.rena.smartstudy'),
    ],
  ),
  Project(
    id: 'hk-golf',
    name: 'HK골프',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2024.11',
    oneLiner: 'HK골프 쇼핑몰 공식 앱 — Flutter+WebView, 한 달 내 양 플랫폼 출시',
    description:
        'HK골프 쇼핑몰 공식 앱. Flutter + WebView로 쇼핑몰 웹을 노출하고, 외부 은행/카드 앱 호출과 '
        'FCM 푸시 등 네이티브 전용 처리를 분리했습니다. 디자인 구현과 결제 흐름 검증 후 한 달 내 '
        'Android·iOS 출시를 완료했습니다.',
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
    screenshots: ['images/projects/golpai-1.jpg', 'images/projects/golpai-2.jpg', 'images/projects/golpai-3.jpg', 'images/projects/golpai-4.jpg', 'images/projects/golpai-5.jpg', 'images/projects/golpai-6.jpg',],
    name: '골파이 온라인 레슨',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2023.11 – 2024.04',
    oneLiner: '골프 자세 분석·1:1 프로 레슨 앱 — 앱 80%+서버 전담, MQTT 채팅',
    description:
        '영상 기반 골프 자세 분석과 프로골퍼 1:1 채팅 레슨 앱. 자세 분석은 계약사(ScreenGo)의 '
        'PyTorch 네이티브 코드를 사용했고, 앱/서버 연동·채팅·이벤트를 맡았습니다. 실시간 채팅을 '
        '위해 앱·서버에 MQTT를 도입하고, 인앱결제 검증과 프로골퍼 정산 로직을 직접 설계·구현했습니다.',
    techStack: ['Flutter', 'Dart REST API', 'Docker', 'MySQL', 'MQTT'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.screengo.golfai'),
    ],
  ),
  Project(
    id: 'bandai-namco',
    screenshots: ['images/projects/bandai-namco-1.jpg', 'images/projects/bandai-namco-2.jpg', 'images/projects/bandai-namco-3.jpg',],
    name: '반다이남코코리아 멤버십·몰',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2021.06 – 2021.08',
    oneLiner: '반다이남코코리아 멤버십 앱 + 쇼핑몰 웹앱 — 앱 단독 개발',
    description:
        '반다이남코코리아 멤버십 앱과 쇼핑몰 웹앱(WebView) 개발. 앱만 단독 개발했고 서버·쇼핑몰 '
        '웹은 외부에서 담당했습니다. 카드/계좌 결제는 네이티브 레이어로 분리했습니다.',
    techStack: ['Flutter', 'WebView'],
    links: [
      ProjectLink('Play Store (멤버십)',
          'https://play.google.com/store/apps/details?id=com.bnkr.member'),
      ProjectLink('Play Store (몰)',
          'https://play.google.com/store/apps/details?id=com.bnkr.mall'),
    ],
  ),
  Project(
    id: 'platform-place',
    name: '플랫폼플레이스·테바코리아·세인트제임스',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2021 ~ 현재',
    oneLiner: '패션·라이프스타일 브랜드 다중 앱 — 단일 코드베이스로 멀티 브랜드 운영',
    description:
        '한 회사가 운영하는 여러 브랜드의 공식 앱. Flutter + WebView 구조에 외부 은행/카드 결제 '
        '호출, FCM 푸시, 스토어 리뷰 관리 등 네이티브 처리를 더했습니다. 2021년 출시 이후 단일 '
        '코드베이스를 브랜드별 디자인·설정·도메인 분기로 확장·운영하고 있습니다.',
    techStack: ['Flutter', 'WebView', 'FCM', 'Deep Links'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=kr.co.platformshop.mobile'),
      ProjectLink('App Store', 'https://apps.apple.com/kr/app/id1578418155'),
    ],
  ),
  Project(
    id: 'kingkoil-berex',
    screenshots: ['images/projects/kingkoil-berex-1.jpg', 'images/projects/kingkoil-berex-2.jpg', 'images/projects/kingkoil-berex-3.jpg', 'images/projects/kingkoil-berex-4.jpg', 'images/projects/kingkoil-berex-5.jpg',],
    name: '킹코일 스마트라이프 & 코웨이 BEREX',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2019 – 2024.09',
    oneLiner: 'BLE 스마트 매트리스 멀티 브랜드 앱 — 단독으로 기술 마이그레이션 2회',
    description:
        'iOBED 매트리스 리모컨 앱에서 시작해 동일 하드웨어를 쓰는 King Koil·코웨이 BEREX 브랜드로 '
        '확장한 프로젝트. BLE 양방향 통신으로 경도 조절·수면 측정·리포트를 제공합니다. 단독으로 '
        'Qt/QML(양 플랫폼) → Flutter 재개발의 기술 마이그레이션을 두 차례 완수했습니다.',
    techStack: ['Qt/QML → Flutter', 'BLE'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/developer?id=iOBED'),
    ],
  ),
  Project(
    id: 'serajeum-iot',
    screenshots: ['images/projects/serajeum-iot-1.jpg', 'images/projects/serajeum-iot-2.jpg', 'images/projects/serajeum-iot-3.jpg', 'images/projects/serajeum-iot-4.jpg', 'images/projects/serajeum-iot-5.jpg', 'images/projects/serajeum-iot-6.jpg',],
    name: '세라젬 IoT',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2019 – 2021',
    role: '앱+서버 단독',
    oneLiner: '안마베드 원격제어·콘텐츠 앱 — MQTT JSON 프로토콜, 앱+서버 단독',
    description:
        '세라젬 안마베드 원격 제어 및 콘텐츠·이벤트 앱. MQTT 위 양방향 JSON 프로토콜로 디바이스를 '
        '제어하고 상태를 수신합니다. 앱과 서버를 단독으로 맡았고, REST API 서버는 Qt/C++로 구현해 '
        'Docker로 배포했습니다.',
    techStack: ['Qt/QML', 'Qt/C++ REST API', 'Docker', 'MySQL', 'MQTT'],
  ),
  Project(
    id: 'focus-timer',
    screenshots: ['images/projects/focus-timer-1.jpg',],
    name: '방치의 신',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2017 ~ 현재',
    oneLiner: '스마트폰 미사용 시간 보상 앱 — 8년+ 운영, 서버까지 풀스택 인수',
    description:
        '스마트폰을 덮어둔 미사용 시간을 측정해 포인트를 보상하는 자체 앱. 오퍼월·네이티브 광고·'
        '기프티콘 상점을 연동해 보상 사이클을 완성했습니다. 앱 단독으로 시작해 서버 개발자 이탈 후 '
        'Node.js REST API·Docker·MySQL까지 인수해 8년 넘게 운영하고 있습니다.',
    impact: '2017년 출시 이후 8년+ 운영.',
    techStack: ['Qt/QML', 'Node.js REST API', 'Docker', 'MySQL'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.rena.focustimer'),
    ],
  ),
  Project(
    id: 'ls-plc',
    screenshots: ['images/projects/ls-plc-1.jpg', 'images/projects/ls-plc-2.jpg', 'images/projects/ls-plc-3.jpg', 'images/projects/ls-plc-4.jpg', 'images/projects/ls-plc-5.jpg',],
    name: 'LS산전 XGT-PLC',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2017',
    oneLiner: '산업용 PLC 모니터링 앱 — C++ 통신 로직을 모바일로 직접 포팅',
    description:
        'LS산전 PLC(산업 자동화 컨트롤러)에 연결해 모니터링·데이터 읽기/쓰기를 하는 앱. 기존 '
        'Android 앱과 C++ 윈도우 프로그램의 통신 코드를 분석해 핵심 프로토콜 로직을 모바일'
        '(Android·iOS)로 직접 포팅했습니다. 단일 앱에서 USB·RS232 시리얼·Bluetooth·Wi-Fi TCP '
        '4가지 통신을 통합 지원합니다.',
    techStack: ['Qt/QML', 'Android Native (Java)', 'iOS Native (Obj-C)'],
  ),
  Project(
    id: 'mobile-stock',
    name: '모바일증권 1·2',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2015',
    oneLiner: '오퍼월 리워드 앱 2종 (외주) — 리워드 앱 라인의 토대',
    description:
        '오퍼월 광고 기반의 외주 리워드 앱 2종. 광고 시청·미션 완료로 포인트를 적립하고 기프티콘으로 '
        '교환합니다. Android Native(Java)만 개발했고 서버는 외부에서 담당했습니다. 이후 착한동전'
        '(2016~)·방치의 신(2017~) 리워드 앱 라인의 토대가 되었습니다.',
    techStack: ['Android Native (Java)'],
  ),
  Project(
    id: 'musicon',
    screenshots: ['images/projects/musicon-1.jpg', 'images/projects/musicon-2.jpg', 'images/projects/musicon-3.jpg',],
    name: '뮤직온',
    category: ProjectCategory.renasoftwareMobile,
    org: 'Renasoftware · Mobile',
    period: '2013',
    role: '단독 개발',
    oneLiner: 'YouTube 기반 음악 차트/플레이어 — 누적 100만 다운로드',
    description:
        'YouTube 기반 음악 차트·플레이어 앱. 차트, 개인 앨범(재생목록), 영상 재생, 백그라운드 오디오 '
        '재생을 제공합니다. 1~2개월 단독 개발로 2013년 누적 100만 다운로드를 달성했습니다.',
    impact: '2013년 누적 100만 다운로드.',
    techStack: ['Android Native (Java)'],
  ),

  // ── Renasoftware · Desktop ────────────────────────────────────────────
  Project(
    id: 'ablemax-optaq',
    screenshots: ['images/projects/ablemax-optaq-1.jpg', 'images/projects/ablemax-optaq-2.jpg', 'images/projects/ablemax-optaq-3.jpg',],
    name: 'ableMAX OptaQ',
    category: ProjectCategory.renasoftwareDesktop,
    org: 'Renasoftware · Desktop',
    period: '2019',
    oneLiner: '빅데이터 기반 AI 예측 모델 생성·검증 데스크톱 프로그램',
    description:
        '빅데이터 기반 AI 예측 모델 생성/검증 데스크톱 프로그램. 다양한 차트·그래프와 데이터 '
        'Import/Export 기능을 제공합니다. 머신러닝 알고리즘·모델 생성/예측은 ableMAX의 Python '
        '라이브러리를 사용했고, 프로그램 구현을 2인이 함께 담당했습니다.',
    techStack: ['Qt/QML', 'C++'],
    links: [ProjectLink('관련 자료', 'https://www.ablemax.co.kr/90')],
  ),
  Project(
    id: 'etri-cps',
    screenshots: ['images/projects/etri-cps-1.jpg', 'images/projects/etri-cps-2.jpg', 'images/projects/etri-cps-3.jpg',],
    name: 'ETRI CPS Visualizer',
    category: ProjectCategory.renasoftwareDesktop,
    org: 'Renasoftware · Desktop',
    period: '2011',
    oneLiner: '국방 CPS(사이버물리시스템) 3D 실시간 시각화',
    description:
        'ETRI가 개발한 CPS(사이버물리시스템) — 국방 무기체계 통합 통신 SW — 의 실시간 3D 시각화 '
        '프로그램. Ogre 3D 기반으로 2인이 함께 개발했습니다.',
    techStack: ['Ogre 3D', 'C++', 'MFC'],
    links: [
      ProjectLink('관련 영상', 'https://www.youtube.com/watch?v=qVxigVszOn4'),
    ],
  ),

  // ── 개인·외주 ─────────────────────────────────────────────────────────
  Project(
    id: 'goodcoin',
    name: '착한동전',
    category: ProjectCategory.personalCommissioned,
    org: '외주',
    period: '2016 ~ 현재',
    oneLiner: '포인트 적립·기프티콘 리워드 앱 — 9년+ 라이브 유지보수',
    description:
        '오퍼월·네이티브 광고·이벤트로 포인트를 적립하고 기프티콘을 구매하는 리워드 앱. 사용자 '
        '소통을 위한 커뮤니티 기능을 포함합니다. 2016년 출시 이후 9년 넘게 안정적으로 운영·점진 '
        '개선하는 외주 프로젝트입니다.',
    impact: '2016년 출시 이후 9년+ 운영.',
    techStack: ['Qt/QML'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=kr.jknet.goodcoin'),
    ],
  ),
  Project(
    id: 'pica',
    name: 'PICA',
    category: ProjectCategory.personalCommissioned,
    org: '개인 · 출시',
    period: '2021.04 ~ 현재',
    role: '단독 개발',
    oneLiner: 'libraw를 NDK로 직접 빌드한 RAW 사진 편집 앱 — 개인 기획·출시',
    description:
        '무료 RAW 이미지 편집이 거의 없던 시장의 빈틈을 노려 직접 기획·개발한 사진 편집 앱. 유료 '
        '솔루션 대신 오픈소스 libraw를 NDK로 빌드해 네이티브 RAW 편집을 제공하고, GPUImage·LUT '
        '이미지 기반 효과/필터와 인앱 구독을 단독 구현했습니다. 4년차 운영 중 누적 1만+ 다운로드, '
        '활성 사용자 700+를 유지하며 Flutter로 재개발해 iOS 출시를 준비하고 있습니다.',
    impact: '누적 1만+ 다운로드, 활성 사용자 700+. Flutter 재개발로 iOS 출시 준비 중.',
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
    name: 'Paletton',
    category: ProjectCategory.side,
    org: 'Side · AI 바이브코딩',
    period: '2025',
    role: '단독 개발',
    oneLiner: '컬러 팔레트 생성·추출 도구 — AI 바이브코딩으로 개발',
    description:
        'AI 코딩 도구(Claude)를 활용해 단독 개발·출시한 컬러 팔레트 도구. 색 조합 생성과 '
        '이미지에서의 컬러 추출을 지원합니다.',
    techStack: ['Flutter', 'AI 코딩'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.ssgz.paletton'),
    ],
  ),
  Project(
    id: 'runup',
    name: 'RunUp',
    category: ProjectCategory.side,
    org: 'Side · AI 바이브코딩',
    period: '2025',
    role: '단독 개발',
    oneLiner: '러닝·하이킹·라이딩 GPS 트래킹 앱 — AI 바이브코딩으로 개발',
    description:
        'AI 코딩 도구(Claude)로 단독 개발한 운동 트래킹 앱. 러닝·하이킹·라이딩의 경로와 활동 '
        '기록을 제공합니다.',
    techStack: ['Flutter', 'GPS', 'AI 코딩'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.ssgz.runup'),
    ],
  ),
  Project(
    id: 'lottolab',
    name: '로또연구실',
    category: ProjectCategory.side,
    org: 'Side · AI 바이브코딩',
    period: '2025',
    role: '단독 개발',
    oneLiner: 'QR 당첨확인·번호 분석 로또 도구 — AI 바이브코딩으로 개발',
    description:
        'AI 코딩 도구(Claude)로 단독 개발한 로또 도구. QR 스캔으로 당첨을 확인하고 번호를 '
        '분석합니다.',
    techStack: ['Flutter', 'AI 코딩'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.ssgz.lottolab'),
    ],
  ),
  Project(
    id: 'oneul',
    name: '오늘은',
    category: ProjectCategory.side,
    org: 'Side · AI 바이브코딩',
    period: '2025',
    role: '단독 개발',
    oneLiner: '사주·타로·운세 앱 — AI 바이브코딩으로 개발',
    description: 'AI 코딩 도구(Claude)로 단독 개발한 운세 앱. 사주·타로·운세 콘텐츠를 제공합니다.',
    techStack: ['Flutter', 'AI 코딩'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.ssgz.oneul'),
    ],
  ),
  Project(
    id: 'vintageshot',
    name: 'VintageShot',
    category: ProjectCategory.side,
    org: 'Side · AI 바이브코딩',
    period: '2025',
    role: '단독 개발',
    oneLiner: '필름 감성 카메라 앱 — AI 바이브코딩으로 개발',
    description:
        'AI 코딩 도구(Claude)로 단독 개발한 카메라 앱. 필름 카메라 감성의 촬영 경험을 제공합니다.',
    techStack: ['Flutter', 'Camera', 'AI 코딩'],
    links: [
      ProjectLink('Play Store',
          'https://play.google.com/store/apps/details?id=com.ssgz.vintageshot'),
    ],
  ),
];
