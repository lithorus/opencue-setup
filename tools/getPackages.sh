#!/bin/bash

source .env

#curl -OL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/${OPENCUE_RELEASE}/pycue-${OPENCUE_RELEASE}-all.tar.gz
#curl -OL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/${OPENCUE_RELEASE}/pyoutline-${OPENCUE_RELEASE}-all.tar.gz
#curl -OL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/${OPENCUE_RELEASE}/cueadmin-${OPENCUE_RELEASE}-all.tar.gz
#curl -OL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/${OPENCUE_RELEASE}/cuegui-${OPENCUE_RELEASE}-all.tar.gz

virtualenv venv # If you previously created a virtualenv, skip this step.
source venv/bin/activate

for package in pycue-${OPENCUE_RELEASE}-all.tar.gz pyoutline-${OPENCUE_RELEASE}-all.tar.gz cueadmin-${OPENCUE_RELEASE}-all.tar.gz cuegui-${OPENCUE_RELEASE}-all.tar.gz
do
    curl -OL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/${OPENCUE_RELEASE}/$package
    export TAR=$package
    export DIR=$(basename "$TAR" .tar.gz)
    tar xvzf "$TAR"
    cd "$DIR"
    pip install -r requirements.txt
    if [[ -f requirements_gui.txt ]]
    then
        pip install -r requirements_gui.txt
    fi
    python setup.py install
    cd ..
    rm -rf "$DIR"
done
