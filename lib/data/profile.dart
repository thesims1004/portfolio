// Owner profile — bio, contact, highlights, skills. Pure data.

class ProfileStat {
  final String value; // '500만+'  or  'AInoon'
  final String label; // '스냅무비 다운로드'
  const ProfileStat(this.value, this.label);
}

class ProfileContact {
  final String label; // 'EMAIL' / 'GITHUB'
  final String value; // shown text
  final String? href; // null → not yet available (rendered as pending chip)
  const ProfileContact(this.label, this.value, this.href);

  bool get pending => href == null;
}

class SkillGroup {
  final String title; // 'Mobile'
  final String subtitle; // '주력 · 영역'
  final List<String> items;
  const SkillGroup(this.title, this.subtitle, this.items);
}

abstract final class Profile {
  static const name = '심진웅';
  static const nameEn = 'Sim Jin woong';

  /// Profile photo served from `web/`. Set to null to show the placeholder slot.
  /// Save the photo as `web/images/profile.jpg` for it to appear.
  // ignore: unnecessary_nullable_for_final_variable_declarations
  static const String? photo = 'images/profile.jpg';
  static const title = '앱 개발자 · Mobile · Desktop · AI 스마트 글래스';
  static const badge = '이직 활동 중 · Open to work';
  static const education = '한국기술교육대학교 컴퓨터공학부 · 2004 – 2012';

  static const intro =
      '15년 넘게 다양한 산업군의 모바일·데스크톱 앱을 직접 개발·출시해온 개발자입니다. '
      'ETRI · LS산전 · 코웨이 · 세라젬 · 반다이남코코리아 · 함소아한의원 · 플랫폼플레이스 등 '
      '여러 기업의 외주 프로젝트와 함께, 회사 자체 서비스 앱으로 누적 500만 · 100만 다운로드 '
      '성과도 만들어보았습니다. 현재는 시어스랩(Seerslab)에서 AI 스마트 글래스 제품을 담당하고 있습니다.';

  static const stats = <ProfileStat>[
    ProfileStat('500만+', '스냅무비 다운로드'),
    ProfileStat('100만+', '뮤직온 다운로드'),
    ProfileStat('15년+', '앱·SW 개발 경력'),
    ProfileStat('AInoon', 'AI 스마트 글래스 출시'),
  ];

  static const contacts = <ProfileContact>[
    ProfileContact('Email', 'thesims1004@gmail.com', 'mailto:thesims1004@gmail.com'),
    ProfileContact('Phone', '010-4351-1379', 'tel:01043511379'),
    ProfileContact('GitHub', 'github.com/thesims1004', 'https://github.com/thesims1004'),
    ProfileContact(
        'LinkedIn', 'in/thesims1004', 'https://www.linkedin.com/in/thesims1004'),
  ];

  /// Strength keywords absorbed from the (removed) About section into Skills.
  static const strengths = <String>[
    'Flutter',
    'Clean Architecture',
    'BLE',
    'AI 디바이스',
    '풀사이클 책임',
    'AI 코딩 도구',
  ];

  static const skillGroups = <SkillGroup>[
    SkillGroup('Mobile', '주력 · 영역', [
      'Flutter / Dart',
      'Android (Java/Kotlin)',
      'iOS (Obj-C/Swift)',
      'Qt/QML',
    ]),
    SkillGroup('Architecture', '앱 설계', [
      'Clean Architecture',
      'Bloc',
      'Freezed',
      'GetIt',
      'MVVM',
      'Flutter Plugin',
    ]),
    SkillGroup('Backend', '서버 · 인프라', [
      'Dart',
      'Node.js',
      'PHP',
      'REST',
      'MySQL',
      'SQLite',
      'Docker',
      'Firebase',
    ]),
    SkillGroup('Desktop', '네이티브', [
      'C++',
      'MFC',
      'C#',
      'Qt',
    ]),
  ];
}
