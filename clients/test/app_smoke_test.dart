import 'dart:convert';

import 'package:clients/core/theme/design_tokens.dart';
import 'package:clients/main.dart' as app;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('Abre o ecrã Clientes com o tema e os ficheiros Inter', (
    tester,
  ) async {
    app.main();
    await tester.pumpAndSettle();

    final title = find.text('Clientes');
    expect(title, findsOneWidget);
    expect(
      find.ancestor(of: title, matching: find.byType(AppBar)),
      findsOneWidget,
    );

    final titleContext = tester.element(title);
    expect(DefaultTextStyle.of(titleContext).style.fontFamily, 'Inter');
    final theme = Theme.of(titleContext);
    expect(theme.textTheme.bodyMedium?.fontFamily, 'Inter');
    expect(theme.scaffoldBackgroundColor, AppColors.background);
    expect(theme.colorScheme.primary, AppColors.primary);

    await tester.runAsync(() async {
      final manifest = jsonDecode(
        await rootBundle.loadString('FontManifest.json'),
      ) as List<dynamic>;
      final inter = manifest.cast<Map<String, dynamic>>().singleWhere(
        (entry) => entry['family'] == 'Inter',
      );
      final fonts = (inter['fonts'] as List<dynamic>)
          .cast<Map<String, dynamic>>();
      expect(
        fonts.map((font) => font['weight']),
        unorderedEquals([400, 600, 700]),
      );
      for (final font in fonts) {
        final data = await rootBundle.load(font['asset'] as String);
        expect(data.lengthInBytes, greaterThan(0));
      }
    });
    expect(tester.takeException(), isNull);
  });
}
