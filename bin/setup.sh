#!/bin/sh

echo "Enter OpenWeatherMap API key"
read line
echo $line | secret-tool store --label='OpenWeatherMap API Key' openweathermap api_key
secret-tool lookup openweathermap api_key
