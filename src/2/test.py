#!/usr/bin/env python3
import subprocess
import sys
import pyopenjtalk

# 1. テキスト入力
text = "こんにちは。本家パイパーとハイファイキャプテンのテストです。"

# 2. OpenJTalk で音素（Phoneme）列に変換
# pyopenjtalk は "k o n n i ch i h a" のようなスペース区切りの音素列を返します
phonemes = pyopenjtalk.g2p(text)
print(f"G2P変換結果: {phonemes}")

# 3. 本家 piper バイナリとモデルのパス（※環境に合わせて書き換えてください）
piper_bin = "/tmp/work/piper_official/piper/piper"
model_path = "/tmp/work/piper_official/piper/models/ja_JP-hi_fi_captain-medium.onnx"

# 4. 男声 (--speaker 0) で生成
cmd_speaker0 = [
    piper_bin,
    "--model", model_path,
    "--speaker", "0",
    "--output_file", "output_speaker0.wav"
]
p0 = subprocess.Popen(cmd_speaker0, stdin=subprocess.PIPE, text=True)
p0.communicate(input=phonemes)

# 5. 女声 (--speaker 1) で生成
cmd_speaker1 = [
    piper_bin,
    "--model", model_path,
    "--speaker", "1",
    "--output_file", "output_speaker1.wav"
]
p1 = subprocess.Popen(cmd_speaker1, stdin=subprocess.PIPE, text=True)
p1.communicate(input=phonemes)

print("生成完了: output_speaker0.wav / output_speaker1.wav")
