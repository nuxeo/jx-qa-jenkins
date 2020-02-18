#!/bin/bash

VERSION=$1

jx step create pr regex --regex "^(?m)\s+Image: .*\/qa-jenkinsx\s+ImageTag: (.*)$" \
  --version ${VERSION} \
  --files values.yaml \
  --repo https://github.com/nuxeo/jx-qa-env.git
