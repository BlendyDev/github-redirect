#!/bin/bash
URL="https://github.com/BlendyDev"
data=$(curl -s "$URL")
tags=$(echo "$data" | grep "property=\"og:")
title=$(echo "$data" | grep "<title>")
mkdir dist
touch dist/index.html
cp background.png dist
cat << EOF > dist/index.html
<!DOCTYPE html>
<html>
  <head>
    $title
    <meta charset="UTF-8">
    $tags
    <meta http-equiv="refresh" content="0;url=https://github.com/blendydev" />
    <link rel="canonical" href="$URL" />
  </head>
  <body style="background-image: url('./background.png');">
  </body>
</html>
EOF
echo "HTML generated"
