# 심진웅 · Mobile App Developer 포트폴리오

15년차 모바일 앱 개발자 심진웅(Simson Shim)의 개인 포트폴리오 사이트.
[Jaspr](https://jaspr.site) 기반 정적 사이트(SSG)로, GitHub Pages에 배포합니다.

## 개발

```bash
dart pub get
jaspr serve          # http://localhost:8080
```

jaspr CLI가 PATH에 없다면 전체 경로로 실행하세요:
`C:\Users\JWSIM\AppData\Local\Pub\Cache\bin\jaspr.bat serve`

## 빌드

```bash
jaspr build          # 출력: build/jaspr/
dart analyze lib     # 정적 분석
```

## 배포

`main` 브랜치에 push하면 GitHub Actions(`.github/workflows/deploy.yml`)가
자동으로 빌드해 GitHub Pages에 배포합니다.

> **프로젝트 사이트**(`user.github.io/portfolio/`)로 배포할 경우 워크플로의
> `jaspr build`에 `--base-href=/portfolio/`를 추가하세요.
> **사용자 사이트**(`user.github.io`)면 기본값 `/`로 두면 됩니다.

## 구조

프로젝트 구조·컨벤션·TODO는 [`CLAUDE.md`](CLAUDE.md) 참고.
