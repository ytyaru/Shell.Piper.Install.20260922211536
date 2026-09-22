# 作業用 RAM ディスクディレクトリへ移動（無ければ作成）
WORKDIR="/tmp/ram_piper"
mkdir -p "${WORKDIR}"
cd "${WORKDIR}"

# RAM ディスク上に venv を作成して有効化
python3 -m venv test_venv
source test_venv/bin/activate

# 一時環境内で pyopenjtalk をインストール
pip install --upgrade pip
pip install pyopenjtalk