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

- **Flutter:** `>=3.35.3` (recommended tested: `3.35.6`)
- **Dart:** `3.9.2`
- Project SDK constraint (see `pubspec.yaml`): `sdk: ^3.7.2`

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

Follow these steps to add a new widget and register it so it appears in the web preview app:

1. Create the widget file under `lib/widget` (for example `lib/widgets/animation/touchable_opacity.dart`). Implement the widget as normal Flutter code. If you use `doc_widget`, annotate with `@docWidget` to enable generator support.

```dart
// lib/widgets/animation/touchable_opacity.dart
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

@docWidget
class TouchableOpacity extends StatefulWidget { /* ... */ }
```

2. Run the generator if your project uses code generation:

```sh
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

3. Create a preview file under `widget_docs/widgets/` (for example `widget_docs/widgets/animation/touchable_opacity_preview.dart`). Register an `ElementPreview` or use the `renderPreview(...)` helper so the preview shows up in the drawer:

```dart
// widget_docs/widgets/animation/touchable_opacity_preview.dart
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import '../../../lib/widgets/animation/touchable_opacity.dart';

final touchablePreview = ElementPreview(
	document: /* metadata */,
	previews: [
		WidgetPreview(
			title: 'TouchableOpacity',
			widget: Builder(builder: (_) => TouchableOpacity(/* ... */)),
		),
	],
);
```

4. Format, analyze and run the preview locally to verify:

```sh
flutter run -t widget_docs/doc_widget_main.dart
```

5. Commit your changes and open a Pull Request targeting the `dev` branch.

Notes:
- Make sure preview files are placed under `widget_docs/widgets/` so the preview app can discover them.
- If the generator creates files that must be committed, include them or explain in the PR that reviewers should run codegen.
- The CI runs format/analyze/tests on PRs; run those locally before creating the PR to avoid CI failures.

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
│  └─ widgets/                # reusable widgets
├─ widget_docs/               # documentation preview app + previews
│  ├─ doc_preview_app.dart    # preview app shell
│  └─ widgets/                # preview widgets (usage, device frame, etc.)
├─ assets/                    # assets (fonts, svg)
└─ pubspec.yaml
```

---

## Preview App

Open `widget_docs/doc_preview_app.dart` to run the documentation preview app. Key preview widgets:

- `widget_docs/widgets/preview/device_frame_switcher.dart` — DeviceFrame switcher (iOS / Android / Web)
- `widget_docs/widgets/preview/usage_doc_widget.dart` — selectable, syntax-highlighted code previews

The preview app drawer includes a small repository info area (owner + contributors) and a "Contribute here" link which opens the repository in the browser or via `url_launcher` on native platforms.

---

## Thêm một widget và hiển thị trên Web Preview

Dưới đây là các bước để thêm một widget mới và hiển thị nó trong web preview (những thao tác giống những gì đã thực hiện trong repo):

1. Tạo file widget trong `lib/` (ví dụ `lib/widgets/animation/touchable_opacity.dart`). Viết widget theo chuẩn Flutter. Sử dụng `@docWidget` nếu bạn muốn khai thác `doc_widget` generator.

```dart
// lib/widgets/animation/touchable_opacity.dart
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

@docWidget
class TouchableOpacity extends StatefulWidget { /* ... */ }
```

2. Tạo file preview trong `widget_docs/widgets/` (ví dụ `widget_docs/widgets/animation/touchable_opacity_preview.dart`). Đăng ký một `ElementPreview` hoặc dùng helper `renderPreview(...)` để preview xuất hiện trong drawer.

```dart
// widget_docs/widgets/animation/touchable_opacity_preview.dart
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import '../../../lib/widgets/animation/touchable_opacity.dart';

final touchablePreview = ElementPreview(
	document: /* metadata */,
	previews: [
		WidgetPreview(
			title: 'TouchableOpacity',
			widget: Builder(builder: (_) => TouchableOpacity(/* ... */)),
		),
	],
);
```

3. Chạy generator (nếu project sử dụng codegen):

```sh
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Kiểm tra, định dạng và chạy preview locally:

```sh
dart format .
flutter analyze
flutter run -t widget_docs/doc_widget_main.dart
```

5. Commit, push và mở PR vào nhánh `dev`.

Ghi chú ngắn:
- Đảm bảo file preview nằm trong thư mục mà preview app scan (thường là `widget_docs/widgets/`).
- Nếu generator tạo các file cần commit, nhớ commit các file generated theo quy ước dự án.
- Nếu CI của repo check format/analyze/tests, chạy những lệnh kiểm tra trước khi tạo PR để tránh CI fail.


