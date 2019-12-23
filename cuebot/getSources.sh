#!/bin/bash

source .env
mkdir deploy
cd deploy
curl -OL https://github.com/AcademySoftwareFoundation/OpenCue/archive/${OPENCUE_RELEASE}.tar.gz
tar xvf ${OPENCUE_RELEASE}.tar.gz
