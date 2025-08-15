#!/bin/bash
# Session Git Workflow Script for Ubuntu/Linux
# This script demonstrates the protocol: create branch, commit, rebase, delete branch

set -e

BRANCH="ai-experiment-$(date +%Y%m%d-%H%M%S)"

# 1. Create experimental branch
git checkout -b "$BRANCH"

# 2. Add and commit all changes
git add .
git commit -m "session: commit all changes via session script"

# 3. Switch to main and rebase
git checkout main
git rebase "$BRANCH"

# 4. Delete experimental branch
git branch -d "$BRANCH"

echo "Session git workflow complete. All changes are now on main."
