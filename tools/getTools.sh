#!/bin/bash

source .env

#curl -OL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/${OPENCUE_RELEASE}/pycue-${OPENCUE_RELEASE}-all.tar.gz
#curl -OL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/${OPENCUE_RELEASE}/pyoutline-${OPENCUE_RELEASE}-all.tar.gz
#curl -OL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/${OPENCUE_RELEASE}/cueadmin-${OPENCUE_RELEASE}-all.tar.gz
#curl -OL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/${OPENCUE_RELEASE}/cuegui-${OPENCUE_RELEASE}-all.tar.gz

virtualenv "opencue-${OPENCUE_RELEASE}" # If you previously created a virtualenv, skip this step.
source "opencue-${OPENCUE_RELEASE}/bin/activate"

for PACKAGE in pycue pyoutline cueadmin cuegui cuesubmit rqd
do
    curl -OL "https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/v${OPENCUE_RELEASE}/${PACKAGE}-${OPENCUE_RELEASE}-all.tar.gz"
    TAR=${PACKAGE}-${OPENCUE_RELEASE}-all.tar.gz
    DIR=$(basename "${TAR}" .tar.gz)
    tar xvzf "${TAR}"
    cd "${DIR}"
    pip install -r requirements.txt
    if [[ -f requirements_gui.txt ]]
    then
        pip install -r requirements_gui.txt
    fi
    python setup.py install
    cd ..
    rm -rf "${DIR}"
done
