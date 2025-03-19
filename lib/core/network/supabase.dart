import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yritys_app/core/constants/api_keys.dart';

class SupabaseService {
  // Initialize Supabase
  static Future<void> init() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  // Get a reference to your Supabase client
  static SupabaseClient get client => Supabase.instance.client;
}
