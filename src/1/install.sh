#!/usr/bin/env bash
# 設置用ディレクトリの作成
INSTALL_DIR="/tmp/work/piper_official"
mkdir -p "${INSTALL_DIR}"
cd "${INSTALL_DIR}"

# 1. Raspberry Pi 4B (64-bit OS / aarch64) 用の公式ビルド済みバイナリを取得
# (※ 最新リリースバージョン 2023.11.14-2 例)
wget https://github.com/rhasspy/piper/releases/download/2023.11.14-2/piper_linux_aarch64.tar.gz

# 2. 解凍 (piper ディレクトリが展開されます)
tar -xvf piper_linux_aarch64.tar.gz

# 3. hi_fi_captain モデルの配置用フォルダ作成
mkdir -p "${INSTALL_DIR}/piper/models"
cd "${INSTALL_DIR}/piper/models"

# 4. ja_JP-hi_fi_captain-medium モデルと設定ファイルの取得
wget -q "https://huggingface.co/rhasspy/piper-voices/resolve/main/ja/ja_JP/hi_fi_captain/medium/ja_JP-hi_fi_captain-medium.onnx"
wget -q "https://huggingface.co/rhasspy/piper-voices/resolve/main/ja/ja_JP/hi_fi_captain/medium/ja_JP-hi_fi_captain-medium.onnx.json"



# 動作確認

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
