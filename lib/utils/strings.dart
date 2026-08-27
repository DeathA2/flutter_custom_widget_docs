String formatDependenciesForPubspec(List<String> deps) {
  final normalDeps = <String>[];
  final devDeps = <String>[];

  for (final dep in deps) {
    if (dep.trim().contains("doc_widget")) continue;
    final isDev = dep.startsWith('dev:');
    final parts = dep.split(':');
    if (parts.length < 3) continue;

    final name = parts[1];
    final value = dep
        .substring(dep.indexOf(':', dep.indexOf(':') + 1) + 1)
        .trim();

    if (isDev) {
      devDeps.add(_formatEntry(name, value));
    } else {
      normalDeps.add(_formatEntry(name, value));
    }
  }

  final buffer = StringBuffer();
  if (normalDeps.isNotEmpty) {
    buffer.writeln('# Dependencies – put these under "dependencies:"');
    buffer.writeln(normalDeps.join('\n'));
  }
  if (devDeps.isNotEmpty) {
    buffer.writeln(
      '\n# Dev dependencies – put these under "dev_dependencies:"',
    );
    buffer.writeln(devDeps.join('\n'));
  }

  return buffer.toString();
}

String _formatEntry(String name, String value) {
  if (value.startsWith('(')) {
    // git form: (url: ..., path: ..., ref: ...)
    final fields = value
        .replaceAll('(', '')
        .replaceAll(')', '')
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .map((e) {
          final kv = e.split(':');
          if (kv.length < 2) return e;
          final key = kv[0].trim();
          final val = kv.sublist(1).join(':').trim();
          return '    $key: $val';
        })
        .join('\n');
    return '$name:\n  git:\n$fields';
  } else {
    // plain version string
    return '$name: $value';
  }
}

bool isNullOrEmpty(String? value) => value == null || value.isEmpty;

bool isNotNullOrEmpty(String? value) => !isNullOrEmpty(value);
