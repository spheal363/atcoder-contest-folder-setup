#!/bin/bash

# 実行時の日付を取得（YYYYMMDD形式）
today=$(date +"%Y%m%d")
weekday=$(date +"%u")  # 1 (月) 〜 7 (日) の値

# -f または --force オプションの確認
force_mode=false
while [[ $# -gt 0 ]]; do
  case "$1" in
    -f|--force)
      force_mode=true
      shift
      ;;
    *)
      echo "エラー: 不明なオプション '$1'" >&2
      exit 1
      ;;
  esac
done

# forceモードでない場合、土曜日以外はエラー
if [[ "$weekday" -ne 6 && "$force_mode" = false ]]; then
  echo "エラー: フォルダ作成は土曜日のみ可能です。（-f オプションで強制作成可）" >&2
  exit 1
fi

# このスクリプトのあるディレクトリを取得
script_dir=$(cd "$(dirname "$0")" && pwd)

# Templateフォルダのパス（.shと同じ階層）
template_dir="$script_dir/Template"

# AtCoder Beginner Contestフォルダのパス
abc_dir="$script_dir/AtCoder/AtCoder Beginner Contest"
mkdir -p "$abc_dir"

# YYYYMMDD形式で新しいフォルダの作成
target_dir="$abc_dir/$today"

# 既に同じフォルダが存在する場合はエラー
if [[ -d "$target_dir" ]]; then
  echo "エラー: フォルダ '$target_dir' は既に存在します。" >&2
  exit 1
fi

cp -r "$template_dir" "$target_dir"

# template.cppのコピーと削除
cd "$target_dir" || exit
if [[ -f "template.cpp" ]]; then
  for letter in A B C D E F test; do
    cp "template.cpp" "$letter.cpp"
  done
  rm "template.cpp"
fi

target_win_path=$(wslpath -w "$target_dir")

# VS Code を起動
cmd.exe /c code "$target_win_path"

# 終了メッセージ
echo "$target_dir フォルダの作成完了"
