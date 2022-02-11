#!/bin/bash

GH_USER=LtFubuki
GH_REPO=Terraria-Docker-arm64v8
GH_BRANCH=main
curl -L https://github.com/${GH_USER}/${GH_REPO}/archive/refs/heads/${GH_BRANCH}.zip > ${GH_REPO}-${GH_BRANCH}.zip && \
unzip ./${GH_REPO}-${GH_BRANCH}.zip && \
rm ./${GH_REPO}-${GH_BRANCH}.zip
