#!/bin/bash
# Script to remove secrets from git history
# Run this ONLY if you have already rotated all exposed credentials!

# WARNING: This rewrites git history. All developers must sync after running this.

echo "⚠️  WARNING: This script will rewrite git history!"
echo "Ensure all exposed credentials have been rotated on:"
echo "  - Supabase Dashboard"
echo "  - Google Cloud Console"
echo "  - Continue? (y/n)"
read -r response

if [[ ! "$response" =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 1
fi

echo "🔄 Removing secrets from git history..."

# Using BFG Repo-Cleaner (faster and safer than git filter-branch)
if ! command -v bfg &> /dev/null; then
    echo "❌ BFG Repo-Cleaner not installed."
    echo "Install with: brew install bfg (macOS) or download from https://rtyley.github.io/bfg-repo-cleaner/"
    exit 1
fi

# Create exclusion patterns file
cat > /tmp/secret-patterns.txt << 'EOF'
# Supabase JWT patterns
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9

# Google API key patterns
AIzaSy.*

# Firebase/Google service account patterns
AIzaSy|sk_live_|sk_test_|ghp_

EOF

echo "🗑️  Removing exposed credentials..."

# Remove specific files that contained secrets
bfg --delete-files lib/backend/supabase/supabase.dart --no-blob-protection
bfg --delete-files lib/backend/api_requests/api_calls.dart --no-blob-protection
bfg --delete-files lib/app_state.dart --no-blob-protection
bfg --delete-files web/index.html --no-blob-protection

# Also remove secret patterns
bfg --replace-text /tmp/secret-patterns.txt --no-blob-protection

echo "🧹 Cleaning up git internals..."
git reflog expire --expire=now --all
git gc --prune=now --aggressive

echo "📤 Force pushing changes to all branches..."
echo "⚠️  This will rewrite history for all branches!"
echo "Continue? (y/n)"
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    git push origin --force --all
    git push origin --force --tags
    echo "✅ History cleaned successfully!"
    echo ""
    echo "📢 IMPORTANT: All team members must:"
    echo "  1. Backup any local changes"
    echo "  2. Delete their local clone: rm -rf <repo-dir>"
    echo "  3. Clone fresh: git clone <repo-url>"
    echo "  4. Update .env with new credentials"
else
    echo "⏭️  History cleaning cancelled."
    echo "To complete manually:"
    echo "  git push origin --force --all"
    echo "  git push origin --force --tags"
fi

# Cleanup
rm /tmp/secret-patterns.txt

echo ""
echo "✅ Completed!"
