#!/usr/bin/env bash

dir="$HOME/Pictures/Wallpaper"
mkdir -p "$dir"

links=(
  "https://media.discordapp.net/attachments/635625973764849684/1188740414459629658/nixos-mono.png?ex=68b34c88&is=68b1fb08&hm=761729dc6c36712e02551752fd0a90acda83146a4f736732bce9156dea83b3e9&=&format=webp&quality=lossless&width=1818&height=1023",
  "https://media.discordapp.net/attachments/635625973764849684/1399207475642634312/wallpaperflare.com_wallpaper.jpg?ex=68b5a4c2&is=68b45342&hm=88119368aee0a0983441b6b569079b8b191dbc096beec4593d61666ae8ad71e9&=&format=webp&width=1819&height=1023",
  "https://wallpapercat.com/w/full/0/d/5/46753-3840x2160-desktop-4k-gravity-falls-background.jpg",
  "https://cdn.discordapp.com/attachments/635625973764849684/1380909058223112353/thinkpad.jpg?ex=68b849c7&is=68b6f847&hm=24190f60eb95ce7ba440deee161847b5260f69b3b596273c56876ed466ba8810"
)

for url in "${links[@]}"; do
  file="$dir/$(basename "${url%%\?*}")"
  if [ -f "$file" ]; then
    echo "[skip] $file exists"
  else
    wget -O "$file" "$url"
    magick "$file" "${file%.*}_unique.png"
    rm "$file"
    file="${file%.*}.png"
  fi
done

