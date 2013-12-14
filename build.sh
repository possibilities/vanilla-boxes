#!/bin/sh

set -e

bundle install --path gems/
bundle exec veewee vbox build raring64-vanilla --auto --force
rm -rf ./boxes/raring64.box
rm -rf ./boxes/raring64.box.part
vagrant package --base raring64-vanilla --output ./boxes/raring64.box.part
mv ./boxes/raring64.box.part ./boxes/raring64.box
vagrant box remove raring64 virtualbox || true
vagrant box add raring64 ./boxes/raring64.box
