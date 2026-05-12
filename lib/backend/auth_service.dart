import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_config.dart';

/// Thin wrapper around Supabase Auth that lets the existing phone-number
/// UI authenticate users without requiring a Twilio/MessageBird SMS
/// provider. We convert the phone number into a deterministic synthetic
/// email + password and use Supabase's email/password auth, which works
/// out of the box. When real phone OTP gets configured in the project,
/// `signInWithPhoneOtp` / `verifyOtp` are also exposed.
class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  SupabaseClient get _client => Supabase.instance.client;

  Session? get currentSession => _client.auth.currentSession;
  User? get currentUser => _client.auth.currentUser;
  bool get isSignedIn => currentSession != null;

  Stream<AuthState> get onAuthChange => _client.auth.onAuthStateChange;

  /// Normalise a phone string into digits + leading "+", e.g.
  /// "+963 990 123 456" -> "+963990123456".
  String _normalisePhone(String raw) {
    final cleaned = raw.replaceAll(RegExp(r'[^\d+]'), '');
    if (cleaned.startsWith('+')) return cleaned;
    return '+963$cleaned';
  }

  String _emailForPhone(String phone) {
    final digits = _normalisePhone(phone).replaceAll('+', '');
    return '$digits@${SupabaseConfig.phoneEmailDomain}';
  }

  String _passwordForPhone(String phone) {
    final digits = _normalisePhone(phone).replaceAll('+', '');
    // Deterministic password derived from the phone number; not a secret,
    // but salted to avoid trivial collisions with other apps using the
    // same idea. Production setups should switch to real phone OTP.
    final hash = sha256.convert(utf8.encode('noor::$digits::v1')).toString();
    return 'N!${hash.substring(0, 24)}';
  }

  /// Sign the user in. If the account doesn't exist yet it is created
  /// (mailer auto-confirm is enabled server-side, so no email is sent).
  /// Returns the resulting session.
  Future<Session> signInOrSignUpWithPhone(
    String phone, {
    String? displayName,
    String? initials,
    String? grade,
    String? province,
    String? fieldOfStudy,
  }) async {
    final email = _emailForPhone(phone);
    final password = _passwordForPhone(phone);
    final normalisedPhone = _normalisePhone(phone);

    AuthResponse response;
    try {
      response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on AuthException catch (_) {
      response = await _client.auth.signUp(
        email: email,
        password: password,
        data: {
          if (displayName != null) 'display_name': displayName,
          if (initials != null) 'initials': initials,
          'phone_number': normalisedPhone,
        },
      );
      if (response.session == null) {
        // mailer_autoconfirm is enabled, but if a project has it disabled
        // we still try a password sign-in immediately after signUp.
        response = await _client.auth.signInWithPassword(
          email: email,
          password: password,
        );
      }
    }

    final session = response.session;
    if (session == null) {
      throw const AuthException('Could not start a session after signup.');
    }

    // Upsert the profile row so RLS-protected reads work right away.
    await _client.from('profiles').upsert({
      'id': session.user.id,
      if (displayName != null) 'display_name': displayName,
      if (initials != null) 'initials': initials,
      'phone_number': normalisedPhone,
      if (grade != null) 'grade': grade,
      if (province != null) 'province': province,
      if (fieldOfStudy != null) 'field_of_study': fieldOfStudy,
    }, onConflict: 'id');

    return session;
  }

  /// Real phone OTP path. Only works if the project has an SMS provider
  /// (Twilio, MessageBird, etc.) configured under Auth -> Providers.
  Future<void> sendPhoneOtp(String phone) =>
      _client.auth.signInWithOtp(phone: _normalisePhone(phone));

  Future<AuthResponse> verifyPhoneOtp({
    required String phone,
    required String code,
  }) =>
      _client.auth.verifyOTP(
        phone: _normalisePhone(phone),
        token: code,
        type: OtpType.sms,
      );

  Future<void> signOut() => _client.auth.signOut();
}
