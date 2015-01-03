#!/bin/bash

# Replace "sculpin generate" with "php sculpin.phar generate" if sculpin.phar
# was downloaded and placed in this directory instead of sculpin having been
# installed globally.

if [ $# -ne 1 ]; then
  echo "usage: ./publish.sh \"commit message\""
  exit 1;
fi

sculpin generate --env=prod
if [ $? -ne 0 ]; then echo "Could not generate the site"; exit 1; fi

cd output_prod
git add *
git commit -m "$1"
git push origin --all

#rsync -avze 'ssh -p 4668' output_prod/ username@yoursculpinsite:public_html
#if [ $? -ne 0 ]; then echo "Could not publish the site"; exit 1; fi
