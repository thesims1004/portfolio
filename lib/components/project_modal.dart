import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/project.dart';
import '../design/tokens.dart';

/// Project detail modal. A backdrop (click → [onClose]) sits behind the panel,
/// so clicks inside the panel never reach it — no propagation handling needed.
class ProjectModal extends StatelessComponent {
  const ProjectModal(this.project, {required this.onClose, super.key});

  final Project project;
  final void Function() onClose;

  @override
  Component build(BuildContext context) {
    return div(classes: 'modal-root', [
      div(classes: 'modal-backdrop', events: {'click': (_) => onClose()}, []),
      div(classes: 'modal-panel', [
        div(classes: 'modal-figure', [
          if (project.screenshots.isNotEmpty)
            div(classes: 'gallery${project.screenshots.length > 1 ? ' multi' : ''}', [
              for (final shot in project.screenshots)
                div(classes: 'gframe', [
                  img(src: shot, alt: project.name, attributes: {'loading': 'lazy'}),
                ]),
            ])
          else
            div(classes: 'fig-empty', [
              span([Component.text('${project.name} 스크린샷')]),
            ]),
          if (project.screenshots.length > 1)
            span(classes: 'gallery-hint', [
              Component.text('${project.screenshots.length}장 · 좌우로 스크롤'),
            ]),
          button(
            classes: 'modal-close',
            attributes: {'aria-label': '닫기'},
            events: {'click': (_) => onClose()},
            [Component.text('✕')],
          ),
        ]),
        div(classes: 'modal-body', [
          div(classes: 'modal-cat', [Component.text(project.overline)]),
          div(classes: 'modal-head', [
            h2(classes: 'modal-title', [Component.text(project.name)]),
            if (project.role != null)
              span(classes: 'role-badge', [Component.text(project.role!)]),
          ]),
          div(classes: 'modal-period', [Component.text(project.period)]),
          p(classes: 'modal-desc', [Component.text(project.description)]),
          if (project.impact != null)
            div(classes: 'impact', [
              div(classes: 'impact-label', [Component.text('Impact')]),
              div(classes: 'impact-text', [Component.text(project.impact!)]),
            ]),
          if (project.techStack.isNotEmpty) ...[
            div(classes: 'stack-label', [Component.text('Tech Stack')]),
            div(classes: 'modal-tags', [
              for (final t in project.techStack)
                span(classes: 'tag', [Component.text(t)]),
            ]),
          ],
          if (project.links.isNotEmpty)
            div(classes: 'modal-links', [
              for (final l in project.links)
                a(
                  href: l.url,
                  target: Target.blank,
                  attributes: {'rel': 'noopener noreferrer'},
                  classes: 'modal-link',
                  [Component.text('${l.label} ↗')],
                ),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.modal-root').styles(
          position: .fixed(top: Unit.zero, left: Unit.zero, right: Unit.zero, bottom: Unit.zero),
          zIndex: const ZIndex(100),
          display: .flex,
          alignItems: .start,
          justifyContent: .center,
          raw: {'overflow-y': 'auto', 'padding': 'clamp(16px,5vh,64px) 16px'},
        ),
        css('.modal-backdrop').styles(
          position: .absolute(top: Unit.zero, left: Unit.zero, right: Unit.zero, bottom: Unit.zero),
          backgroundColor: AppColors.overlay,
          raw: {'backdrop-filter': 'blur(3px)'},
        ),
        css('.modal-panel', [
          css('&').styles(
            position: .relative(),
            width: 100.percent,
            backgroundColor: AppColors.white,
            border: Border.all(color: AppColors.border, width: 1.px),
            overflow: .hidden,
            raw: {
              'max-width': '680px',
              'border-radius': '12px',
              'box-shadow': '0 24px 60px rgba(16,24,40,0.24)',
            },
          ),
          css('.modal-figure', [
            css('&').styles(
              position: .relative(),
              backgroundColor: AppColors.chipBg,
              border: Border.only(
                  bottom: BorderSide(color: AppColors.border, width: 1.px)),
            ),
            // Horizontal filmstrip — height is capped so tall (portrait)
            // screenshots never blow up the modal; multiple images scroll.
            css('.gallery').styles(
              display: .flex,
              alignItems: .center,
              justifyContent: .center,
              raw: {
                'height': 'clamp(240px,42vh,360px)',
                'overflow-x': 'auto',
                'scroll-snap-type': 'x mandatory',
              },
            ),
            css('.gallery.multi').styles(
                justifyContent: .start, raw: {'gap': '1px'}),
            css('.gframe', [
              css('&').styles(
                display: .flex,
                alignItems: .center,
                justifyContent: .center,
                height: 100.percent,
                backgroundColor: AppColors.chipBg,
                raw: {'flex': '0 0 auto', 'scroll-snap-align': 'center'},
              ),
              css('img').styles(
                display: .block,
                height: 100.percent,
                raw: {'width': 'auto', 'object-fit': 'contain'},
              ),
            ]),
            css('.fig-empty').styles(
              display: .flex,
              alignItems: .center,
              justifyContent: .center,
              color: AppColors.textFaint,
              fontSize: AppType.small.px,
              raw: {'aspect-ratio': '16 / 9'},
            ),
            css('.gallery-hint').styles(
              position: .absolute(bottom: 12.px, left: 12.px),
              color: AppColors.white,
              fontFamily: AppFonts.mono,
              raw: {
                'font-size': '11px',
                'background': 'rgba(16,24,40,0.55)',
                'border-radius': '5px',
                'padding': '4px 9px',
                'pointer-events': 'none',
              },
            ),
          ]),
          css('.modal-close', [
            css('&').styles(
              position: .absolute(top: 14.px, right: 14.px),
              display: .flex,
              alignItems: .center,
              justifyContent: .center,
              width: 34.px,
              height: 34.px,
              color: AppColors.text,
              border: .unset,
              cursor: .pointer,
              raw: {
                'border-radius': '7px',
                'background': 'rgba(255,255,255,0.92)',
                'font-size': '18px',
                'line-height': '1',
                'box-shadow': '0 2px 8px rgba(16,24,40,0.15)',
              },
            ),
            css('&:hover').styles(backgroundColor: AppColors.white),
          ]),
          css('.modal-body').styles(raw: {'padding': 'clamp(24px,4vw,34px)'}),
          css('.modal-cat').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            raw: {
              'font-size': '11px',
              'letter-spacing': '0.06em',
              'text-transform': 'uppercase',
              'margin-bottom': '10px',
            },
          ),
          css('.modal-head').styles(
            display: .flex,
            alignItems: .start,
            justifyContent: .spaceBetween,
            gap: Gap.all(AppSpacing.m.px),
            raw: {'margin-bottom': '6px'},
          ),
          css('.modal-title').styles(
            color: AppColors.text,
            fontWeight: .w700,
            raw: {'font-size': 'clamp(22px,3.4vw,27px)', 'letter-spacing': '-0.02em'},
          ),
          css('.role-badge').styles(
            color: AppColors.primary,
            backgroundColor: AppColors.white,
            border: Border.all(color: AppColors.blueChipBorder, width: 1.px),
            fontWeight: .w600,
            raw: {
              'font-size': '11px',
              'border-radius': '5px',
              'padding': '5px 11px',
              'white-space': 'nowrap',
              'letter-spacing': '0.02em',
            },
          ),
          css('.modal-period').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            raw: {'font-size': '12px', 'margin-bottom': '22px'},
          ),
          css('.modal-desc').styles(
            color: AppColors.textMuted,
            raw: {'font-size': '15px', 'line-height': '1.7', 'margin': '0 0 24px'},
          ),
          css('.impact', [
            css('&').styles(
              backgroundColor: AppColors.blueBg,
              border: Border.all(color: AppColors.blueBorder, width: 1.px),
              raw: {'border-radius': '8px', 'padding': '16px 18px', 'margin-bottom': '24px'},
            ),
            css('.impact-label').styles(
              color: AppColors.primary,
              fontFamily: AppFonts.mono,
              raw: {
                'font-size': '11px',
                'letter-spacing': '0.1em',
                'text-transform': 'uppercase',
                'margin-bottom': '6px',
              },
            ),
            css('.impact-text').styles(
              color: AppColors.text,
              fontWeight: .w500,
              raw: {'font-size': '14px', 'line-height': '1.6'},
            ),
          ]),
          css('.stack-label').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            fontWeight: .w500,
            raw: {
              'font-size': '11px',
              'letter-spacing': '0.1em',
              'text-transform': 'uppercase',
              'margin-bottom': '10px',
            },
          ),
          css('.modal-tags').styles(
            display: .flex,
            flexWrap: .wrap,
            gap: Gap.all(AppSpacing.s.px),
            raw: {'margin-bottom': '24px'},
          ),
          css('.modal-tags .tag').styles(
            color: AppColors.chipTextMuted,
            backgroundColor: AppColors.chipBg,
            fontFamily: AppFonts.mono,
            raw: {'font-size': '12px', 'border-radius': '4px', 'padding': '5px 10px'},
          ),
          css('.modal-links').styles(
              display: .flex, flexWrap: .wrap, gap: Gap.all(10.px)),
          css('.modal-link', [
            css('&').styles(
              color: AppColors.primary,
              backgroundColor: AppColors.white,
              border: Border.all(color: AppColors.borderStrong, width: 1.px),
              fontWeight: .w600,
              raw: {
                'font-size': '14px',
                'border-radius': '6px',
                'padding': '9px 15px',
                'transition': 'border-color .15s, background .15s',
              },
            ),
            css('&:hover').styles(
              backgroundColor: const Color('#F7F9FB'),
              border: Border.all(color: AppColors.primary, width: 1.px),
            ),
          ]),
        ]),
      ];
}
