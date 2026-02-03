import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

export 'database/database.dart';
export 'storage/storage.dart';

String _kSupabaseUrl =
    dotenv.env['SUPABASE_URL'] ?? 'https://deycthvditigtcwtvals.supabase.co';
String _kSupabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ??
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRleWN0aHZkaXRpZ3Rjd3R2YWxzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYwMjQyMjgsImV4cCI6MjA1MTYwMDIyOH0.uokijIkfv2jGMH4xWNzYiqiaBOr5UeFUQM7FA2tZZfQ';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        headers: {
          'X-Client-Info': 'flutterflow',
        },
        anonKey: _kSupabaseAnonKey,
        debug: false,
        authOptions:
            FlutterAuthClientOptions(authFlowType: AuthFlowType.implicit),
      );
}
