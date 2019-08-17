#!/bin/bash

# laravel-mix
yarn run watch-poll

# ngrok
ngrok http -host-header=laravel-shop.test -region us 80
