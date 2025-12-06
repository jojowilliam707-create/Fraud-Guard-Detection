#!/bin/bash
set -e

echo "Installing Git LFS..."
apt-get update
apt-get install -y git-lfs

echo "Pulling LFS files..."
git lfs pull

echo "Git LFS setup complete"
