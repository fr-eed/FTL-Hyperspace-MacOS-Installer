#!/bin/bash
# Resolves "latest" to a concrete upstream Hyperspace tag (e.g. v1.22.2).
# Any other value is echoed back unchanged.
# Usage: resolve-hyperspace-version.sh <version>
# Requires: gh CLI authenticated (GH_TOKEN or GITHUB_TOKEN in env).

set -e

VERSION="$1"
if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version>" >&2
  exit 1
fi

if [ "$VERSION" = "latest" ]; then
  VERSION=$(gh release view --repo FTL-Hyperspace/FTL-Hyperspace --json tagName --jq .tagName)
fi

echo "$VERSION"
