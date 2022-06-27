#!/bin/bash
echo "Hello Artona"
sudo bundle install
rails db:migrate
rails s -p 3000