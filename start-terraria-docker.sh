#!/bin/bash

GH_USER=LtFubuki
GH_REPO=Terraria-Docker-arm64v8
GH_BRANCH=main
SERVER_COUNT=$( "terraria-" | docker ps | grep ltfubuki-arm64v8 | wc -l )
eval "$SERVER_COUNT"
curl -L https://github.com/${GH_USER}/${GH_REPO}/archive/refs/heads/${GH_BRANCH}.zip > ${GH_REPO}-${GH_BRANCH}.zip && \
unzip ./${GH_REPO}-${GH_BRANCH}.zip && \
rm ./${GH_REPO}-${GH_BRANCH}.zip && \
cd ${GH_REPO}-${GH_BRANCH} && \
docker build -t ltfubuki/terraria-arm64v8 . && \
mkdir worlds && \
docker run -itd -v worlds:/terraria/worlds -v configs:/terraria/configs -p 7777:7777/tcp --name ${SERVER_COUNT} ltfubuki/terraria-arm64v8
