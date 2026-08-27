# flutter_custom_widget_docs

A documentation preview app and component catalog that demonstrates reusable custom Flutter widgets, their usage examples, and interactive previews.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Website](#website)
- [How to Run](#how-to-run)
- [Using This Repo](#using-this-repo)
- [Dependencies](#dependencies)
- [Code Structure](#code-structure)
- [Preview App](#preview-app)

---

## Prerequisites

- **Flutter:** `>=3.44.6` (recommended tested: `3.44.6`)
- **Dart:** `3.12.2`
- Project SDK constraint (see `pubspec.yaml`): `sdk: ^3.12.2`

---

## Website

The project has a live demo and documentation site available at:

[https://customwidgetdoc.web.app/](https://customwidgetdoc.web.app/)

Open the link to view the hosted preview app and documentation.

---

## How to Run

1. Clone the repo:

```sh
git clone https://github.com/DeathA2/flutter_custom_widget_docs.git
```

2. Install dependencies:

```sh
flutter pub get
```

3. Generate code (if you change generated files / localization):

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Analyze the project:

```sh
flutter analyze
```

5. Run the preview app (web):

```sh
flutter run -t widget_docs/doc_widget_main.dart
```

## Using This Repo

This repository contains both the app/library code and a documentation preview app under `widget_docs/` that shows widget previews and usage examples.

- Add or update widgets in `lib/` as usual.
- To add a preview demonstration, create a preview file under `widget_docs/widgets/` and register it so it appears in the preview drawer.
- The preview app fetches GitHub repo information and contributors to show inside the app drawer (see `lib/network/implement/github_repository_impl.dart`).

## Adding a widget and showing it in the Web preview

1. Create the widget under `lib/widgets/<category>/` (for example
   `lib/widgets/selection/count_badge.dart`) and annotate the public class with
   `@docWidget`. Keep doc comments short — the long explanation belongs in the
   preview description, which is what the docs app actually shows.

```dart
// lib/widgets/selection/count_badge.dart
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

/// Red count badge, meant to sit over an icon inside a `Stack`.
@docWidget
class CountBadge extends StatelessWidget { /* ... */ }
```

2. Run the generator to produce `count_badge.doc_widget.dart`:

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

3. Create the preview at
   `widget_docs/widgets/<category>/<widget>/<widget>_preview.dart` and build it
   with the `renderPreview(...)` helper:

```dart
// widget_docs/widgets/selection/count_badge/count_badge_preview.dart
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/count_badge.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/count_badge.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final _documentation = CountBadgeDocWidget();

final countBadgePreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Count Badge",
  description: "What it is, and why it behaves the way it does.",
  dependencies: _documentation.dependencies,
  code: r'''
CountBadge(count: 12),
  ''',
  widget: DeviceFrameSwitcher(child: CountBadge(count: 12)),
  widgetCode: r'''
// paste the widget source here
  ''',
);
```

   Interactive previews wrap the widget in `DemoValue<T>` from
   `widget_docs/widgets/preview/demo_host.dart`; non-widget APIs use
   `ManualDocumentation` instead of a generated `*DocWidget`.

4. Register it in the category's `*_section.dart`, and register the section in
   `widget_docs/doc_widget_main.dart` if the category is new.

5. Verify locally, then commit and open a PR against `dev`:

```sh
dart format .
flutter analyze
flutter test
flutter run -t widget_docs/doc_widget_main.dart
```

Notes:
- Preview files must live under `widget_docs/widgets/` for the preview app to find them.
- Generated `*.doc_widget.dart` files are committed, so run codegen before pushing.
- `@docWidget` cannot read a `const List<Color>` default — make such parameters
  nullable and fall back to a file-level const, or the generator emits code it
  cannot format.

---

## Contributing

Thank you for considering contributing — this project is public and contributions are welcome. Below is a short guide to make a contribution via GitHub.

1. Fork the repository on GitHub and clone your fork locally:

```sh
git clone https://github.com/<your-username>/flutter_custom_widget_docs.git
cd flutter_custom_widget_docs
git remote add upstream https://github.com/DeathA2/flutter_custom_widget_docs.git
```

2. Create a feature branch for your change (use a descriptive name):

```sh
git checkout -b feat/my-improvement
```

3. Install dependencies and run code generation (if applicable):

```sh
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Format, analyze and test locally before committing:

```sh
dart format .
flutter analyze
flutter test
```

5. Run the preview app locally (optional, useful for UI changes):

```sh
flutter run -t widget_docs/doc_widget_main.dart
```

6. Commit changes with a clear message and push to your fork:

```sh
git add -A
git commit -m "feat(widget): add XYZ with usage preview"
git push origin feat/my-improvement
```

7. Open a Pull Request from your fork → target branch `dev` in this repository. Describe what you changed, why, and include screenshots or recordings for UI changes.

Notes:
- Keep PRs small and focused where possible.
- The repository runs CI on pull requests (format, analyze, tests). Fix any CI failures before the PR can be merged.
- Merges into `dev` are automatically deployed (see CI/CD note above) — plan your changes accordingly.
- If your change affects public APIs, update docs and examples in `widget_docs/`.

## Code Conventions

- See `analysis_options.yaml` for lints and style rules.
- Keep widgets modular and reusable; place common widgets in `lib/widgets/`.
- Naming conventions used in this repo are pragmatic and follow standard Flutter/Dart practices.

---

## Dependencies

This project uses a number of packages; highlights from `pubspec.yaml`:

- `highlight`, `flutter_highlight` — syntax highlighting for code previews
- `dio` — HTTP client used to fetch GitHub data
- `device_frame` — device frames for widget previews
- `url_launcher` — opening external links from the preview app
- `flutter_svg` — SVG rendering

For the full list, see `pubspec.yaml`.

---

## Code Structure

```
.
├─ lib/                       # application/library code
│  ├─ network/                # network layer & GitHub repo implementation
│  ├─ rsc/                    # resources (colors, fonts, images, styles)
│  └─ widgets/                # reusable widgets, one folder per category
├─ widget_docs/               # documentation preview app + previews
│  ├─ doc_preview_app.dart    # preview app shell
│  ├─ doc_widget_main.dart    # entry point, registers every section
│  └─ widgets/                # one folder per category, mirroring lib/widgets/
│     └─ preview/             # shared preview helpers (device frame, demo host)
├─ assets/                    # assets (fonts, svg)
└─ pubspec.yaml
```

### Widget categories

Each category is one folder under `lib/widgets/`, one folder under
`widget_docs/widgets/`, and one `ElementsSection` in the preview drawer. The
folder column below names the `lib/widgets/` folder; two of them predate this
layout and are singular on the preview side (`cards/` → `widget_docs/widgets/card/`,
`rulers/` → `widget_docs/widgets/ruler/`).

| Category | Folder | Widgets |
| --- | --- | --- |
| Animations | `animation/` | TouchableOpacity, ShakeContainer, PulseOnChange, Breathing, AnimatedCounter, TypingDots, StreakFlame, EvolutionVisual, CompanionAvatar |
| Buttons | `buttons/` | FilledButtonApp, OutlineButton, TextActionButton, BottomActionBar |
| Inputs | `inputs/` | AppTextField, PinCodeInput, SearchField |
| Selection Controls | `selection/` | SegmentedTabs, IconSegment, FilterChipBar, WeekStrip, PageIndicator, CountBadge |
| Navigation | `navigation/` | FloatingBottomNav |
| Cards & Tiles | `cards/` | ArticleCard, DetailArticleCard, SurfaceCard, SectionCard, SettingsTile, FeatureTile, GradientProgressCard, InfoChip, FreshnessPill, EmojiAvatar |
| Charts & Progress | `charts/` | ProgressBar, ProgressRing, GaugeMeter, DonutChart, LineChart |
| Rulers | `rulers/` | BubbleColorBar |
| Loading & State | `loading_state/` | ActivityIndicator, Shimmer, SkeletonBox, LoadingOverlay, StatusToast / Toast, EmptyState, ErrorState |
| Chat | `chat/` | ChatBubble, BubbleEnter, ReactionBar, DayDividerPill |
| Gestures | `gesture/` | SwipeActions, SwipeHint, DragAutoScroll |
| Images | `images/` | NetworkImageView, ProofImage, SliverImageHeader |
| Celebration | `celebration/` | Confetti, CelebrationOverlay, coin flight |
| Illustrations | `illustration/` | Coin, JarVisual |
| Decorations | `decorations/` | DashedBorder |
| Shadow Box | `shadow_box/` | ContainerWithShadow |

Colors for these widgets live in `lib/rsc/colors/custom_color_manager.dart`
(`CustomColors`). It is deliberately separate from `ColorsApp`: `ColorsApp` is
the app palette, `CustomColors` is the teal/slate palette this widget set was
designed against.

### Previews with interaction, and non-widget APIs

Two helpers under `widget_docs/widgets/preview/` cover the cases the plain
`renderPreview(...)` recipe does not:

- `demo_host.dart` — `DemoValue<T>` holds state for previews that need a real
  `value` + `onChanged` round trip (tabs, chips, text fields, nav bar), and
  `DemoSurface` gives consistent padding inside the device frame.
- `manual_documentation.dart` — `ManualDocumentation` hand-writes a
  `Documentation` for APIs that `@docWidget` cannot read, because they are not
  widget classes: top-level functions (`playCoinFlight`), static-only classes
  (`DragAutoScroll`), and `SliverPersistentHeaderDelegate` subclasses
  (`SliverImageHeader`).

`test/preview_smoke_test.dart` builds every registered preview and fails if any
of them throws, so a broken preview is caught by `flutter test` rather than by
opening the web app.

---

## Preview App

Open `widget_docs/doc_preview_app.dart` to run the documentation preview app. Key preview widgets:

- `widget_docs/widgets/preview/device_frame_switcher.dart` — DeviceFrame switcher (iOS / Android / Web)
- `widget_docs/widgets/preview/usage_doc_widget.dart` — selectable, syntax-highlighted code previews

The preview app drawer includes a small repository info area (owner + contributors) and a "Contribute here" link which opens the repository in the browser or via `url_launcher` on native platforms.

---
