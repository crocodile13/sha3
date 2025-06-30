#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="sha3-multi"

usage() {
  cat <<EOF
Usage: $0 -b                # Build Docker image
       $0 -e [options]      # Run SHA3 tool with arguments

Examples:
  $0 -b
  $0 -e --help
  $0 -e -t 256 -f /data/file.bin
  echo -n "toto" | $0 -e -t 256 -
EOF
  exit 1
}

if [[ $# -lt 1 ]]; then
    usage
fi

while getopts "be" opt; do
  case "$opt" in
    b)
      echo "==> 🔨 Building Docker image..."
      docker build -t "$IMAGE_NAME" .
      echo "✅ Image built: $IMAGE_NAME"
      exit 0
      ;;
    e)
      shift $((OPTIND -1))
      echo "==> 🚀 Running in Docker..."
      docker run --rm -i "$IMAGE_NAME" "$@"
      exit 0
      ;;
    *)
      usage
      ;;
  esac
done

usage
