# 개발 / 빌드 / 배포

> 이 프로젝트의 개발 환경·빌드·배포 설정 메모. (사이트 소개는 [README.md](README.md))

## 개발

```bash
dart pub get
jaspr serve          # http://localhost:8080
```

jaspr CLI가 PATH에 없으면 전체 경로로 실행:
`%LOCALAPPDATA%\Pub\Cache\bin\jaspr.bat serve`

## 빌드 / 분석

```bash
jaspr build          # 출력: build/jaspr/
dart analyze lib     # 정적 분석
```

## 배포

`main` 브랜치에 push하면 GitHub Actions(`.github/workflows/deploy.yml`)가
자동으로 빌드해 GitHub Pages에 배포합니다.
→ https://thesims1004.github.io/portfolio/

### base-href (중요)

GitHub Pages **프로젝트 사이트**(`user.github.io/portfolio/`)는 하위 경로에서
동작하므로 `<base href>`가 `/portfolio/` 를 가리켜야 한다.

- jaspr 0.22엔 `--base-href` 플래그가 **없음**. 또한 정적 빌드는 `<base href>`를
  항상 절대 경로로 정규화한다(상대값 `./` → `/./` = 루트).
- 그래서 `lib/main.server.dart`의 `Document(base: ...)`를
  `String.fromEnvironment('BASE_HREF', defaultValue: '/portfolio/')`로 지정.
  CI는 기본값(`/portfolio/`)으로 빌드하므로 워크플로에 별도 플래그가 필요 없다.
- 로컬 개발은 `.claude/launch.json`의 `--dart-define=BASE_HREF=/` 로 루트(`/`) 사용.
- 리포지토리명이 `portfolio`가 아니면 위 default 값을 그 이름으로 바꿀 것.

SPA 새로고침 404 방지: 빌드 후 `index.html` → `404.html` 복사(워크플로에 포함).

## 빌드 함정 (Windows)

- `dart run build_runner`를 직접 돌린 뒤 `jaspr build` 하면 **OptionsSkew** 에러가
  날 수 있음 → 되도록 `jaspr build`/`jaspr serve`만 사용. 꼬이면
  `dart run build_runner clean` 후 재빌드.
- 셸 cwd가 `build/jaspr` 안이거나 잔여 `dart` 프로세스가 있으면 디렉터리를 못 지워
  **PathAccessException(errno 32)** 발생 → 프로젝트 루트에서 실행, 꼬이면 `dart`
  프로세스 종료 후 `build/` 삭제.

## 구조 / 컨벤션

폴더 구조·컴포넌트 컨벤션·콘텐츠 TODO는 [`CLAUDE.md`](CLAUDE.md) 참고.
