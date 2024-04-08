// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, avoid_print

import 'dart:io';

void main() async {

  final toJSdir = Directory('lib/backend/chrome_api').listSync();

  await Process.run(
    'flutter',
    [
      'build',
      'web',
      '-t',
      'lib/main.dart',
      '--web-renderer',
      'html',
      '--csp',
    ],
  );

  for (var script in toJSdir) {
    if (script.path.endsWith('.dart')) {

      final String fileName = script.path.replaceAll('lib/backend/chrome_api/', '');

      await Process.run(
        'dart',
        [
          'compile',
          'js',
          (script.path),
          '--output',
          'build/web/$fileName.js',
        ],
      ).then((ProcessResult) => ProcessResult.exitCode == 0
          ? print('Done!')
          : print(ProcessResult.stdout));
    }
  }
}
