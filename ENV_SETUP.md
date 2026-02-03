# Environment Variables Setup Guide

This document explains how to configure environment variables for the Geotela app.

## Overview

All sensitive credentials (API keys, tokens, database URLs) are now stored in environment variables instead of being hardcoded in the source code. This prevents accidental exposure of secrets in version control.

## Setup Instructions

### 1. Copy Environment Template

```bash
cp .env.example .env
```

### 2. Edit `.env` File

Open the `.env` file in your project root and fill in your actual values:

```bash
# Supabase Configuration
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-supabase-anon-key-here

# Google Maps API Key
GOOGLE_MAPS_API_KEY=your-google-maps-api-key-here

# Google Gemini API Key
GOOGLE_GEMINI_API_KEY=your-google-gemini-api-key-here

# App Environment
APP_ENV=development
```

### 3. Get Your Credentials

#### Supabase
1. Go to https://supabase.com → Your Project
2. Settings → API
3. Copy:
   - **Project URL** → `SUPABASE_URL`
   - **Anon Key** (public, safe for client) → `SUPABASE_ANON_KEY`

#### Google Maps API
1. Go to https://console.cloud.google.com
2. APIs & Services → Credentials
3. Create new API Key (or use existing restricted key)
4. Copy key value → `GOOGLE_MAPS_API_KEY`

#### Google Gemini API
1. Go to https://makersuite.google.com/app/apikey
2. Create new API key
3. Copy key value → `GOOGLE_GEMINI_API_KEY`

### 4. Install Dependencies

```bash
flutter pub get
```

### 5. Run the App

```bash
flutter run
```

The app will automatically load the `.env` file on startup.

## Important Security Notes

### ⚠️ DO NOT commit `.env` file

The `.env` file is listed in `.gitignore` to prevent accidental commits. Always use `.env.example` as a template for team members.

### Environment-Specific Configuration

For different environments (development, staging, production), create separate files:

```bash
.env.development    # Local development
.env.staging        # Staging environment
.env.production     # Production (use with caution)
```

Then load the appropriate file:

```dart
// In main.dart
String envFile = '.env.${dotenv.env['APP_ENV'] ?? 'development'}';
await dotenv.load(fileName: envFile);
```

### CI/CD Pipeline

For GitHub Actions or similar CI/CD:

1. Store secrets in repository secrets
2. Create `.env` file during build:

```yaml
- name: Create .env file
  run: |
    echo "SUPABASE_URL=${{ secrets.SUPABASE_URL }}" >> .env
    echo "SUPABASE_ANON_KEY=${{ secrets.SUPABASE_ANON_KEY }}" >> .env
    echo "GOOGLE_MAPS_API_KEY=${{ secrets.GOOGLE_MAPS_API_KEY }}" >> .env
    echo "GOOGLE_GEMINI_API_KEY=${{ secrets.GOOGLE_GEMINI_API_KEY }}" >> .env
```

## Variables Reference

| Variable | Source | Usage |
|----------|--------|-------|
| `SUPABASE_URL` | Supabase Dashboard | Database connection |
| `SUPABASE_ANON_KEY` | Supabase Dashboard | Database authentication |
| `GOOGLE_MAPS_API_KEY` | Google Cloud Console | Maps, geocoding, directions |
| `GOOGLE_GEMINI_API_KEY` | Google AI Studio | AI-powered quiz generation |
| `APP_ENV` | Manual | Environment identification |

## Troubleshooting

### Variables not loading

**Error:** `dotenv: unable to load .env file`

**Solution:**
1. Ensure `.env` file exists in project root
2. Check file permissions
3. Verify file path in `main.dart`

### API calls failing

**Error:** API key invalid or missing

**Solution:**
1. Verify credentials are correct in `.env`
2. Check API key hasn't expired
3. Ensure API is enabled in service console (Google Cloud, Supabase)
4. Check rate limits and quotas

### Web build not loading environment

**Error:** Maps not loading on web platform

**Solution:**
1. For web, the API key should be loaded via backend endpoint (see `web/initialize_maps.js`)
2. Create backend endpoint that securely serves the API key to authenticated requests
3. Or set `window.GOOGLE_MAPS_API_KEY` from your Flutter app

### Mobile build failing

**Error:** Build fails during flutter run

**Solution:**
1. Run `flutter pub get` after adding `.env` variables
2. Clean build: `flutter clean && flutter pub get`
3. Rebuild: `flutter run`

## Best Practices

### 1. Rotate Keys Regularly
- Google Cloud: Rotate API keys every 3-6 months
- Supabase: Rotate JWT tokens when rotating auth keys
- Set calendar reminders for key rotation

### 2. Restrict API Keys
For each API key in Google Cloud:
- **API Restrictions:** Limit to only necessary APIs
- **Application Restrictions:** Limit by app type (Android, iOS, Web)
- **Example for Google Maps:**
  - APIs: `Maps SDK for Android`, `Maps SDK for iOS`, `Maps JavaScript API`
  - Android: Specify package name + certificate
  - iOS: Specify bundle identifier
  - Web: Specify domain/origin

### 3. Monitor Usage
- Google Cloud: Set billing alerts
- Supabase: Monitor real-time requests
- Set up email notifications for unusual activity

### 4. Secure Transport
- Always use HTTPS for API calls
- Validate SSL certificates
- Use token expiry for auth tokens

### 5. Code Review
- Review all PRs for hardcoded secrets
- Use automated secret scanning tools
- Add security checklist to PR template

## Useful Commands

```bash
# View current environment
echo $SUPABASE_URL

# Validate .env file
cat .env

# Load and test environment
flutter run --verbose

# Clean environment
rm .env
cp .env.example .env
```

## References

- [Flutter dotenv package](https://pub.dev/packages/flutter_dotenv)
- [Google Cloud API Keys](https://cloud.google.com/docs/authentication/api-keys)
- [Supabase Configuration](https://supabase.com/docs/guides/auth)
- [OWASP Secrets Management](https://owasp.org/www-community/Sensitive_Data_Exposure)

---

**Last Updated:** February 3, 2026
