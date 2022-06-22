import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logging/logging.dart';
import 'package:xpns42/misc/constants.dart';

import 'app.dart';

Logger _log = Logger('main');

void main() {
  if (kReleaseMode) {
    Logger.root.level = Level.WARNING;
  }

  Logger.root.onRecord.listen((event) {
    debugPrint(
      '${event.level.name}: ${event.time}: ${event.loggerName}: ${event.message}',
    );
  });

  _log.info('$kAppName starting');

  // Ensute widget binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Google Fonts.
  GoogleFonts.config.allowRuntimeFetching = false;

  // Add licences
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/Poppins-OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const Xpns42App());
}
