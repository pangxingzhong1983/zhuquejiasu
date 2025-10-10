import 'dart:io';

void main(List<String> args) {
  if (args.length != 2) {
    stderr.writeln('Usage: dart tools/update_version.dart <version> <buildNumber>');
    exit(1);
  }

  final versionName = args[0].trim();
  final versionCode = args[1].trim();

  if (versionName.isEmpty || versionCode.isEmpty) {
    stderr.writeln('Version name and build number must be non-empty.');
    exit(1);
  }

  final pubspecPath = 'pubspec.yaml';
  final androidPropsPath = 'android/local.properties';
  final ohosAppScopePath = 'ohos/AppScope/app.json5';

  _replaceLine(
    filePath: pubspecPath,
    pattern: RegExp(r'^version:\s*.*$', multiLine: true),
    replacement: 'version: $versionName+$versionCode',
  );

  _replaceLine(
    filePath: androidPropsPath,
    pattern: RegExp(r'^flutter\.versionName=.*$', multiLine: true),
    replacement: 'flutter.versionName=$versionName',
  );

  _replaceLine(
    filePath: androidPropsPath,
    pattern: RegExp(r'^flutter\.versionCode=.*$', multiLine: true),
    replacement: 'flutter.versionCode=$versionCode',
  );

  _replaceLine(
    filePath: ohosAppScopePath,
    pattern: RegExp(r'"versionName":\s*".*"', multiLine: true),
    replacement: '"versionName": "$versionName"',
  );

  _replaceLine(
    filePath: ohosAppScopePath,
    pattern: RegExp(r'"versionCode":\s*\d+', multiLine: true),
    replacement: '"versionCode": $versionCode',
  );

  stdout.writeln('Updated version to $versionName ($versionCode)');
}

void _replaceLine({
  required String filePath,
  required RegExp pattern,
  required String replacement,
}) {
  final file = File(filePath);
  if (!file.existsSync()) {
    stderr.writeln('File not found: $filePath');
    exit(1);
  }

  final content = file.readAsStringSync();
  if (!pattern.hasMatch(content)) {
    stderr.writeln('Pattern not found in $filePath: $pattern');
    exit(1);
  }

  final updated = content.replaceFirst(pattern, replacement);
  file.writeAsStringSync(updated);
}
