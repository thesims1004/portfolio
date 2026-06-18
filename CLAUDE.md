# CLAUDE.md — 심진웅 포트폴리오 사이트

모바일·데스크톱 앱 개발자 심진웅(Sim Jin woong)의 개인 포트폴리오 웹사이트.

## 기술 스택
- **Jaspr** (Dart 웹 프레임워크) — SSG(static) 모드. SEO·초기 로딩 최적화.
- **jaspr_router** — 멀티페이지 라우팅. 현재 `/` 단일 라우트.
- 호스팅: **GitHub Pages 프로젝트 사이트** (`user.github.io/portfolio/`) + GitHub Actions.
- Flutter 임베드(`jaspr_flutter_embed`) 미도입 — 필요 시 부분 추가.

## 디자인
Claude Design 산출물 **"Portfolio A — Top Hero" (Modern 톤)** 를 구현.
- 시드 컬러 `#2E5A8C`, 폰트 Pretendard(KR)·Inter(EN)·JetBrains Mono(라벨).
- 헤어라인 보더, mono 대문자 마이크로 라벨(.overline), 타이트한 radius(6–8px), 넉넉한 여백.
- 페이지 흐름: **Hero(프로필 카드) + Highlights → Skills → Projects → Contact**.
  About 섹션은 제거(소개는 Hero, 강점 칩은 Skills로 흡수).

## 빌드 / 실행
```bash
jaspr serve          # http://localhost:8080 (개발)
jaspr build          # → build/jaspr/ (정적)
dart analyze lib     # 정적 분석
```
> jaspr CLI 경로(PATH 미등록): `C:\Users\JWSIM\AppData\Local\Pub\Cache\bin\jaspr.bat`
> 버전 핀: jaspr `^0.22.4`, jaspr_router `^0.8.1`.

## 폴더 구조
```
lib/
├── main.server.dart      # Document(head/메타/폰트) + App
├── main.client.dart      # @client 아일랜드 마운트
├── app.dart              # 루트: Header + Router
├── design/
│   ├── tokens.dart       # AppColors/AppFonts/AppType/AppSpacing/AppRadius/AppLayout
│   └── theme.dart        # globalStyles (리셋 + .container/.section/.overline)
├── data/                 # 순수 Dart (Jaspr 의존성 없음)
│   ├── project.dart      # Project(org/role/impact 포함)/ProjectCategory/ProjectLink
│   ├── projects_data.dart# 프로젝트 21건
│   └── profile.dart      # 소개·학력·연락처·강점·스킬그룹·하이라이트
├── components/
│   ├── header.dart       # 스티키 내비 (Skills/Projects/이메일)
│   ├── hero.dart         # 프로필 카드 + Highlights 밴드
│   ├── skills.dart       # 강점 칩 + 스킬그룹 4개
│   ├── projects_section.dart  # @client: 필터 탭 + 카드 그리드 + 모달 상태
│   ├── project_card.dart # 카드 (이미지 슬롯·overline·칩·기간)
│   ├── project_modal.dart# 상세 모달 (IMPACT·Tech Stack·링크)
│   └── footer.dart       # Contact 섹션 + 푸터
└── pages/
    └── home_page.dart    # 섹션 조립 (정적)
```

## 컨벤션
- 컴포넌트 스타일은 `@css static List<StyleRule> get styles` 로 정의.
  **`@css`는 public 클래스/멤버에만** 가능 — @client StatefulComponent의 styles는
  State가 아니라 **컴포넌트 클래스**(public)에 둘 것.
- 색상/치수/타이포는 `design/tokens.dart` 토큰만 사용 — 매직 넘버 금지.
- import: DOM/CSS 헬퍼는 `package:jaspr/dom.dart`, 컴포넌트는 `package:jaspr/jaspr.dart`.
- 텍스트 `Component.text(...)`, 다중 루트 `Component.fragment([...])`.
- 반응형: 기본은 intrinsic CSS(auto-fit grid + clamp), 필요한 곳만 `css.media(MediaQuery.all(maxWidth:), [...])`.

## 배포 흐름
- `main` push → `.github/workflows/deploy.yml` → `jaspr build` → GitHub Pages.
- **base-href (중요)**: jaspr 0.22엔 `--base-href` 플래그가 **없고**, 정적 빌드는
  에셋을 상대 경로로 내보내지만 `<base href>`를 항상 절대 경로로 정규화한다(상대값
  `./`는 `/./`=루트로 바뀜). 기본 `<base href="/">`면 `/portfolio/` 하위에서 이미지·
  클라이언트 JS가 전부 404 → 이미지 깨짐 + 모달(@client) 작동 안 함.
  → `main.server.dart`에서 `Document(base: String.fromEnvironment('BASE_HREF',
  defaultValue: '/portfolio/'))`로 **절대 base를 `/portfolio/`로 지정**(CI 기본값).
  로컬 dev는 `.claude/launch.json`의 `--dart-define=BASE_HREF=/`로 루트(`/`) 사용.
  리포지토리명이 다르면 default와 launch 양쪽을 그 이름으로 바꿀 것.
- SPA 새로고침 404 방지: 빌드 후 `index.html` → `404.html` 복사 (워크플로 포함).

## 빌드 함정 (Windows)
- `dart run build_runner` 를 직접 돌린 뒤 `jaspr build` 하면 **OptionsSkew** 에러가 날 수 있음 →
  되도록 `jaspr build`/`jaspr serve`만 사용. 꼬이면 `dart run build_runner clean` 후 재빌드.
- 셸 cwd가 `build/jaspr` 안에 있거나 잔여 `dart` 프로세스가 있으면 빌드가 디렉터리를
  못 지워 **PathAccessException(errno 32)** 발생 → 프로젝트 루트에서 실행하고,
  꼬이면 `dart` 프로세스 종료 후 `build/` 삭제.

## 콘텐츠 현황 / TODO
- ✅ 프로젝트 21건 전부 입력 (Seerslab 3 · Renasoftware Mobile 13 · Desktop 2 · 개인·외주 2 · 사이드 1).
- ✅ 필터 탭(카운트) + 상세 모달 동작.
- ⚠️ 플레이스홀더로 둔 항목: `차세대 RTOS 글래스`(상세 미정), `AI 바이브코딩 5종`(라인업 미정),
  프로필 사진·프로젝트 썸네일(이미지 슬롯), GitHub·LinkedIn 링크(`Profile.contacts`의 `pending`).
- ⬜ 이미지 채우기: `web/images/projects/{id}/...` 추가 후 `Project.thumbnail`/`screenshots` 연결,
  webp(데스크톱 ~800px / 모바일 ~400px) + `loading="lazy"`.
- ⬜ OG 이미지(1200×630), 커스텀 도메인(선택).

## 원본 자료
- 콘텐츠 원본(영문, 21건): 포트폴리오 docx
  (Google Docs `14t0qtcqqTQJmvH2I37aqTCLtY8NtNxX8`).
- 디자인 원본: Claude Design `b1f95d8c-a675-4171-9a38-9e909fb3adca` (file: Portfolio A — Top Hero).
  B안(Sticky Sidebar)도 존재 — 사이드바형으로 바꾸려면 Hero를 좌측 고정 사이드바로 재구성.
