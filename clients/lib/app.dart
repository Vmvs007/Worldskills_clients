import 'package:material_ui/material_ui.dart';

import 'core/theme/app_theme.dart';
import 'features/clients/presentation/screens/clients_list_screen.dart';

class ClientsApp extends StatelessWidget {
  const ClientsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clientes',
      supportedLocales: const [Locale('pt', 'PT')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const ClientsListScreen(),
    );
  }
}
