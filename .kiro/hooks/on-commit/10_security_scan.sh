#!/bin/bash
# Hook: 10_security_scan.sh
# Type: on-commit
# Description: Performs a pre-commit scan for common secrets (API keys, passwords) to prevent accidental exposure, including in all common configuration files.
# Compliance: Enforces FR-3 (Preventive Security Scanning) from specs/requirements.md and S-CONF-001 from steering/security.md.

# --- Configuration ---
# Searches for common secret patterns in staged files.
SECRET_PATTERNS='(password|secret|api_key|token|aws_access_key_id|private_key)'
EXCLUDE_DIRS="--exclude-dir={.git,node_modules,vendor,dist,build}"

# --- Execution ---
echo "--- Running Kiro Security Pre-Commit Scan (10_security_scan.sh) ---"

# 1. Check for staged files containing common secret patterns
echo "1. Scanning staged files for secrets..."
if git diff --cached | grep -E "$SECRET_PATTERNS" ; then
    echo " "
    echo "!!! SECURITY ALERT (Staged Files) !!!"
    echo "The following staged files appear to contain sensitive information."
    echo "Please remove the secrets or use a proper secret management system before committing."
    echo "Commit aborted to prevent accidental exposure."
    echo " "
    exit 1 # Abort the commit
fi

# 2. Check all common configuration files for hardcoded secrets (Enforcing S-CONF-001)
# Targets common config files and IaC files (.env, .json, .yaml, .yml, .tf)
echo "2. Scanning common configuration files for hardcoded secrets..."

# Note: Using 'grep -r' on the entire project ('.') is safer for comprehensive scanning.
# We use a regex to include common config file extensions.
if grep -r -E "$SECRET_PATTERNS" . --include="*\.env" --include="*\.json" --include="*\.yaml" --include="*\.yml" --include="*\.tf" $EXCLUDE_DIRS ; then
    echo " "
    echo "!!! SECURITY ALERT (Configuration Files) !!!"
    echo "Hardcoded secrets were found in common configuration files (e.g., .env, .json, .yaml, .tf)."
    echo "This violates the Security First principle (S-CONF-001). Use environment variables or a secret manager."
    echo "Commit aborted."
    echo " "
    exit 1 # Abort the commit
fi

echo "Security scan passed. No common secrets detected."
exit 0 # Allow the commit
