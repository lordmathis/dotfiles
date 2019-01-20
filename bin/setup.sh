#!/bin/sh

echo "Enter OpenWeatherMap API key"
read line
echo $line | secret-tool store --label='OpenWeatherMap API Key' openweathermap api_key

echo "Enter KeePassXC master password"
read line
echo $line | secret-tool store --label='KeePassXC master password' keepassxc master

echo "Enter git name"
read name
git config --global user.name $name

echo "Enter git email"
read email
git config --global user.email $email
