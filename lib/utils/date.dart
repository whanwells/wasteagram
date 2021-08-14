import 'package:intl/intl.dart';

final _formatter = DateFormat('EEEE, MMMM d, y');

String formatDate(DateTime date) => _formatter.format(date);
