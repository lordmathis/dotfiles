#!/bin/sh

secret-tool lookup keepassxc master | keepassxc --pw-stdin ~/Documents/Important/passwords.kdbx
