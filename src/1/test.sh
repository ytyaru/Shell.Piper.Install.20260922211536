#!/usr/bin/env bash
INSTALL_DIR="/tmp/work/piper_official"

cd "${INSTALL_DIR}/piper"

# 話者 0（男性または女性）
echo "こんにちは。本家 Piper の日本語テストです。" | \
  ./piper \
  --model models/ja_JP-hi_fi_captain-medium.onnx \
  --speaker 0 \
  --output_file test_speaker0.wav

# 話者 1（もう一方の声）
echo "こんにちは。本家 Piper の日本語テストです。" | \
  ./piper \
  --model models/ja_JP-hi_fi_captain-medium.onnx \
  --speaker 1 \
  --output_file test_speaker1.wav

# 再生確認
aplay test_speaker0.wav
aplay test_speaker1.wav
