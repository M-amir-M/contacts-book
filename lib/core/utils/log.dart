import 'package:logger/logger.dart';


Object? valueLogDebugTest;
var valueLogErrorTest;
var valueLogStackTest;

void logDebug({String tag = '======', required Object value}) {
  valueLogDebugTest = value;

//  logger.v("Verbose log");

  // logger.i("${value.toString()}");

// logger.i("Info log");

// logger.w("Warning log");

// logger.e("Error log");
// /
// logger.wtf("What a terrible failure log");

  print('$tag: ${value.toString()}');
}


class LogDebug {
  static Logger logger = Logger();

  static info({String tag = '', required Object value}) {
    logger.i("$tag : $value");
  }
  static error({String tag = '', required Object value}) {
    logger.e("$tag : $value");
  }
  static warning({String tag = '', required Object value}) {
    logger.w("$tag : $value");
  }
  static wtf({String tag = '', required Object value}) {
    logger.wtf("$tag : $value");
  }
}


void logError({error, stack}) {
  if (error != null) {
    valueLogErrorTest = error;
    print('error: $error');
  }
  if (stack != null) {
    valueLogStackTest = stack;
    print('stack: $stack');
  }
}
