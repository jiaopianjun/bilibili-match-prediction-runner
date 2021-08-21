#!/bin/bash
version=$(wget -qO- -t1 -T2 "https://api.github.com/repos/JunzhouLiu/bilibili-match-prediction/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g;s/V//g')

wget -O "bilibili-match-prediction.zip" "https://github.com/JunzhouLiu/bilibili-match-prediction/releases/download/V${version}/bilibili-match-prediction-v${version}.zip"
mkdir "jar"
unzip -o "bilibili-match-prediction.zip" -d "./jar/"
mv "./jar/bilibili-match-prediction-v${version}.jar" "./jar/bilibili-match-prediction.jar" -f
cp -f "./config.json" "./jar/config.json"
rm "bilibili-match-prediction.zip"

echo "下载完成"
