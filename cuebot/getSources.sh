#!/bin/bash

source .env
mkdir deploy
cd deploy
curl -o source.tar.gz -L https://github.com/AcademySoftwareFoundation/OpenCue/archive/refs/tags/v${OPENCUE_RELEASE}.tar.gz
tar xvf source.tar.gz
