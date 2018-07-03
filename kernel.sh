#!/usr/bin/env bash
#bundle install
#bundle exec jekyll build
#bundle exec jekyll serve

rm -rf tmp
rm -rf _site
current=${PWD}
bundle exec jekyll build
mkdir tmp && cd tmp
repo=cloudfx.github.io
git clone https://devbhuwan@github.com/cloudfx/${repo}.git
cd ${repo}
cp -R ${current}/_site/* .
git add *
git commit -m "Updated: $1"
git push
cd ${current}
rm -rf tmp
rm -rf _site