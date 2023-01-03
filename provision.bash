#!/bin/bash

curl -L https://omnitruck.cinc.sh/install.sh | sudo bash -s -- -P cinc-workstation -v 22

if [[ -d '/tmp/.X11-unix' ]]; then
  solo_config_file='solo-full-system.json'
else
  solo_config_file='solo-no-x11-system.json'
fi

popd 'chef' || exit > /dev/null
cinc-solo -j"${PWD}/configs/${solo_config_file}" -c"${PWD}/.chef/solo.rb"
pushd || exit > /dev/null
