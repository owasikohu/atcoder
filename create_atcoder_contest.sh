#!/usr/bin/env bash

set -euo pipefail

read -r -p "ディレクトリ（コンテスト名）を入力してください: " contest_dir
read -r -p "コンテスト番号を入力してください: " contest_number
read -r -p "ファイル数を入力してください: " file_count
read -r -p "拡張子を入力してください（例: cpp / py）: " extension

if [[ -z "${contest_dir}" ]]; then
  echo "エラー: ディレクトリ名が空です。"
  exit 1
fi

if [[ -z "${contest_number}" ]]; then
  echo "エラー: コンテスト番号が空です。"
  exit 1
fi

if ! [[ "${file_count}" =~ ^[1-9][0-9]*$ ]]; then
  echo "エラー: ファイル数は1以上の整数を入力してください。"
  exit 1
fi

# 先頭のドットを取り除く（.cpp -> cpp）
extension="${extension#.}"
if [[ -z "${extension}" ]]; then
  echo "エラー: 拡張子が空です。"
  exit 1
fi

target_dir="${contest_dir}/${contest_number}"
mkdir -p "${target_dir}"

template_file="${PWD}/template.${extension}"

# 0 -> A, 1 -> B, ..., 25 -> Z, 26 -> AA, ...
index_to_label() {
  local index="$1"
  local label=""
  local remainder

  while :; do
    remainder=$((index % 26))
    label="$(printf "\\$(printf '%03o' $((65 + remainder)))")${label}"
    index=$((index / 26 - 1))
    if (( index < 0 )); then
      break
    fi
  done

  printf "%s" "${label}"
}

for ((i = 0; i < file_count; i++)); do
  file_label="$(index_to_label "${i}")"
  output_file="${target_dir}/${file_label}.${extension}"

  if [[ -f "${template_file}" ]]; then
    cp "${template_file}" "${output_file}"
  else
    : > "${output_file}"
  fi
done

echo "作成完了: ${target_dir} に ${file_count} 個の .${extension} ファイルを作成しました。"
if [[ -f "${template_file}" ]]; then
  echo "template.${extension} の内容を各ファイルにコピーしました。"
else
  echo "template.${extension} が見つからなかったため、空ファイルを作成しました。"
fi
