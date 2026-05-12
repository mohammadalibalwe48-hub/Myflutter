/// Compile-time Supabase configuration for the ioop / Myflutter app.
///
/// The URL and anon key are public values that are safe to ship in a client
/// binary. Sensitive operations are protected by Row Level Security on the
/// database side. See `supabase/schema.sql` for the schema and policies.
class SupabaseConfig {
  static const String url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://jsiaplwtuxmusaotkmrp.supabase.co',
  );

  static const String anonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzaWFwbHd0dXhtdXNhb3RrbXJwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzg1MzA0MjksImV4cCI6MjA5NDEwNjQyOX0.ZXSMszPgeOF1DgemCdUBwtUcokctb7a-NNVDfekeOnc',
  );

  /// Domain used to convert a phone number into a synthetic email so the app
  /// can sign users in with Supabase Email Auth (which works out of the box,
  /// no SMS provider required). The user still sees a phone-number field in
  /// the UI; the conversion happens entirely in the auth service.
  static const String phoneEmailDomain = 'noor.app';
}
