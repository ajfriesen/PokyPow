#!/bin/bash
set -e

# Configuration
POKYPOW_YAML="ESPHome/pokypow.yaml"

# Ensure we are in the repo root
if [ ! -f "$POKYPOW_YAML" ]; then
    echo "Error: Could not find $POKYPOW_YAML. Are you in the repo root?"
    exit 1
fi

# Check for clean working directory
if [ -n "$(git status --porcelain)" ]; then
    echo "Error: Working directory is not clean. Please commit or stash changes first."
    exit 1
fi

# Get current version
CURRENT_VERSION=$(grep 'version: "' "$POKYPOW_YAML" | sed -E 's/.*version: \"([^\"]+)\".*/\1/')
echo "Current version: $CURRENT_VERSION"

# Ask for new version
read -p "Enter new version (e.g., 0.4.3): " NEW_VERSION

if [ -z "$NEW_VERSION" ]; then
    echo "Error: Version cannot be empty."
    exit 1
fi

if [ "$NEW_VERSION" == "$CURRENT_VERSION" ]; then
    echo "Error: New version is the same as current version."
    exit 1
fi

# Update version in pokypow.yaml
# Use a temporary file to ensure we don't break the file if sed fails
sed -E "s/version: \"$CURRENT_VERSION\"/version: \"$NEW_VERSION\"/" "$POKYPOW_YAML" > "$POKYPOW_YAML.tmp" && mv "$POKYPOW_YAML.tmp" "$POKYPOW_YAML"

echo "Updated $POKYPOW_YAML to version $NEW_VERSION"

# Show diff
git diff "$POKYPOW_YAML"

read -p "Commit, Tag, Push, and Release? (y/N) " CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
    echo "Aborting. Reverting changes..."
    git checkout "$POKYPOW_YAML"
    exit 0
fi

# Commit
git add "$POKYPOW_YAML"
git commit -m "Bump version to $NEW_VERSION"

# Tag
git tag "$NEW_VERSION"

# Push
echo "Pushing changes and tag..."
git push
git push origin "$NEW_VERSION"

# Create Release
echo "Creating GitHub Release..."
gh release create "$NEW_VERSION" --generate-notes

echo "Done! The release has been created."
echo "The GitHub Actions pipeline should now:"
echo "1. Build the firmware."
echo "2. Upload artifacts to the release."
echo "3. Update the manifest (if the workflow is fixed)."
echo "4. Build and deploy the documentation."
