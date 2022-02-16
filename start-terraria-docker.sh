#!/bin/bash

GH_USER=LtFubuki
GH_REPO=Terraria-Docker-arm64v8
GH_BRANCH=main
SERVER_COUNT=$( docker ps --no-trunc | grep ltfubuki/terraria-arm64v8 | wc -l )
SERVER_NAME=terraria
SERVER_PORT=$((${SERVER_COUNT} + 7777))
if [ ! -d ${GH_REPO}-${GH_BRANCH}.zip ]; then curl -L https://github.com/${GH_USER}/${GH_REPO}/archive/refs/heads/${GH_BRANCH}.zip > ${GH_REPO}-${GH_BRANCH}.zip; fi && \
if [ ! -d ${GH_REPO}-${GH_BRANCH} ]; then unzip unzip ./${GH_REPO}-${GH_BRANCH}.zip; fi && \
rm ./${GH_REPO}-${GH_BRANCH}.zip && \
cd ${GH_REPO}-${GH_BRANCH} && \
docker build -t ltfubuki/terraria-arm64v8 . && \
if [ ! -d worlds ]; then mkdir worlds; fi && \
docker run -itd -v worlds:/terraria/worlds -v configs:/terraria/configs -p ${SERVER_PORT}:7777/tcp --name ${SERVER_NAME}-${SERVER_COUNT} ltfubuki/terraria-arm64v8
