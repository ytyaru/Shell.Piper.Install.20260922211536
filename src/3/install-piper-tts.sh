#!/usr/bin/env bash
# 1. RAM ディスク上の作業ディレクトリを作成・移動
WORKDIR="/tmp/ram_piper_hifi"
mkdir -p "${WORKDIR}"
cd "${WORKDIR}"

# 2. 一時的な venv の作成と有効化
python3 -m venv venv
source venv/bin/activate

# 3. piper-tts のインストール
pip install --upgrade pip
pip install piper-tts

# 4. 発話テスト（hi_fi_captain の ONNX と JSON があるパスを指定）
# ※ パスは環境に合わせて書き換えてください
MODEL_PATH="/tmp/work/piper_official/piper/models/ja_JP-hi_fi_captain-medium.onnx"

echo "こんにちは。ハイファイキャプテンのテストです。" | \
  piper --model "${MODEL_PATH}" --output_file output_hifi.wav

# 5. 音声の確認
aplay output_hifi.wav
