#!/bin/bash
set -euo pipefail

exec mono TerrariaServer.exe -config "/configs/serverconfig.txt"
