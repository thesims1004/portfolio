import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/project.dart';
import '../design/tokens.dart';

/// Project detail modal. A backdrop (click → [onClose]) sits behind the panel,
/// so clicks inside the panel never reach it — no event-propagation handling
/// needed.
class ProjectModal extends StatelessComponent {
  const ProjectModal(this.project, {required this.onClose, super.key});

  final Project project;
  final void Function() onClose;

  @override
  Component build(BuildContext context) {
    return div(classes: 'modal-root', [
      div(
        classes: 'modal-backdrop',
        events: {'click': (_) => onClose()},
        [],
      ),
      div(classes: 'modal-panel', [
        button(
          classes: 'modal-close',
          attributes: {'aria-label': '닫기'},
          events: {'click': (_) => onClose()},
          [Component.text('×')],
        ),
        div(classes: 'modal-thumb', [
          if (project.thumbnail != null)
            img(src: project.thumbnail!, alt: project.name)
          else
            span(classes: 'thumb-name', [Component.text('${project.name} 스크린샷')]),
        ]),
        div(classes: 'modal-body', [
          div(classes: 'modal-head', [
            span(classes: 'overline', [Component.text(project.overline)]),
            if (project.role != null)
              span(classes: 'role-badge', [Component.text(project.role!)]),
          ]),
          h3(classes: 'modal-title', [Component.text(project.name)]),
          span(classes: 'modal-period', [Component.text(project.period)]),
          p(classes: 'modal-desc', [Component.text(project.description)]),
          if (project.impact != null)
            div(classes: 'impact', [
              span(classes: 'overline', [Component.text('Impact')]),
              p(classes: 'impact-text', [Component.text(project.impact!)]),
            ]),
          if (project.techStack.isNotEmpty) ...[
            span(classes: 'overline mt', [Component.text('Tech Stack')]),
            div(classes: 'modal-tech', [
              for (final t in project.techStack)
                span(classes: 'chip', [Component.text(t)]),
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
                  [
                    Component.text(l.label),
                    span(classes: 'ext', [Component.text('↗')]),
                  ],
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
          zIndex: const ZIndex(1000),
          display: .flex,
          alignItems: .center,
          justifyContent: .center,
          padding: .all(AppSpacing.l.px),
        ),
        css('.modal-backdrop').styles(
          position: .absolute(top: Unit.zero, left: Unit.zero, right: Unit.zero, bottom: Unit.zero),
          backgroundColor: AppColors.overlay,
          raw: {'backdrop-filter': 'blur(2px)'},
        ),
        css('.modal-panel', [
          css('&').styles(
            position: .relative(),
            display: .flex,
            flexDirection: .column,
            width: 100.percent,
            maxWidth: 560.px,
            maxHeight: 88.vh,
            backgroundColor: AppColors.white,
            radius: .circular(AppRadius.l.px),
            border: Border.all(color: AppColors.border, width: 1.px),
            overflow: .hidden,
            raw: {'box-shadow': '0 24px 60px rgba(20,24,31,0.28)'},
          ),
          css('.modal-close', [
            css('&').styles(
              position: .absolute(top: 12.px, right: 12.px),
              zIndex: const ZIndex(2),
              display: .flex,
              alignItems: .center,
              justifyContent: .center,
              width: 32.px,
              height: 32.px,
              color: AppColors.text,
              backgroundColor: AppColors.headerBg,
              border: Border.all(color: AppColors.border, width: 1.px),
              radius: .circular(AppRadius.full.px),
              fontSize: 1.25.rem,
              cursor: .pointer,
            ),
            css('&:hover').styles(backgroundColor: AppColors.surfaceSunken),
          ]),
          css('.modal-thumb', [
            css('&').styles(
              display: .flex,
              alignItems: .center,
              justifyContent: .center,
              backgroundColor: AppColors.surfaceSunken,
              border: Border.only(
                  bottom: BorderSide(color: AppColors.border, width: 1.px)),
              raw: {'aspect-ratio': '16 / 8'},
            ),
            css('.thumb-name').styles(
                color: AppColors.textFaint, fontSize: AppType.small.rem),
            css('img').styles(
              width: 100.percent,
              height: 100.percent,
              raw: {'object-fit': 'cover'},
            ),
          ]),
          css('.modal-body').styles(
            display: .flex,
            flexDirection: .column,
            gap: Gap.all(AppSpacing.s.px),
            padding: .all(AppSpacing.l.px),
            overflow: .auto,
          ),
          css('.modal-head').styles(
            display: .flex,
            alignItems: .center,
            justifyContent: .spaceBetween,
            gap: Gap.all(AppSpacing.m.px),
          ),
          css('.role-badge').styles(
            padding: .symmetric(horizontal: 10.px, vertical: 4.px),
            color: AppColors.primary,
            border: Border.all(color: AppColors.impactBorder, width: 1.px),
            radius: .circular(AppRadius.full.px),
            fontSize: AppType.tiny.rem,
            fontWeight: .w600,
            raw: {'white-space': 'nowrap'},
          ),
          css('.modal-title').styles(
            color: AppColors.text,
            fontSize: AppType.h3.rem,
            fontWeight: .w800,
          ),
          css('.modal-period').styles(
            color: AppColors.textFaint,
            fontFamily: AppFonts.mono,
            fontSize: AppType.tiny.rem,
          ),
          css('.modal-desc').styles(
            margin: .only(top: AppSpacing.xs.px),
            color: AppColors.textMuted,
            fontSize: AppType.small.rem,
            lineHeight: 1.75.em,
          ),
          css('.impact', [
            css('&').styles(
              margin: .symmetric(vertical: AppSpacing.s.px),
              padding: .all(AppSpacing.m.px),
              backgroundColor: AppColors.impactBg,
              border: Border.all(color: AppColors.impactBorder, width: 1.px),
              radius: .circular(AppRadius.m.px),
            ),
            css('.impact-text').styles(
              margin: .only(top: AppSpacing.xs.px),
              color: AppColors.text,
              fontSize: AppType.small.rem,
              lineHeight: 1.6.em,
            ),
          ]),
          css('.overline.mt').styles(margin: .only(top: AppSpacing.s.px)),
          css('.modal-tech').styles(
            display: .flex,
            flexWrap: .wrap,
            gap: Gap.all(AppSpacing.xs.px),
            margin: .only(top: AppSpacing.xs.px),
          ),
          css('.modal-links').styles(
            display: .flex,
            flexWrap: .wrap,
            gap: Gap.all(AppSpacing.s.px),
            margin: .only(top: AppSpacing.m.px),
          ),
          css('.modal-link', [
            css('&').styles(
              display: .inlineFlex,
              alignItems: .center,
              gap: Gap.all(AppSpacing.xs.px),
              padding: .symmetric(horizontal: 14.px, vertical: 9.px),
              color: AppColors.text,
              border: Border.all(color: AppColors.borderStrong, width: 1.px),
              radius: .circular(AppRadius.s.px),
              fontSize: AppType.small.rem,
              fontWeight: .w600,
              transition: Transition('all', duration: Duration(milliseconds: 150)),
            ),
            css('&:hover').styles(
              color: AppColors.primary,
              border: Border.all(color: AppColors.primary, width: 1.px),
            ),
            css('.ext').styles(
                color: AppColors.textFaint, fontFamily: AppFonts.en),
          ]),
        ]),
      ];
}
