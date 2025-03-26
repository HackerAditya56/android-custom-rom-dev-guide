#!/usr/bin/

sudo apt install git

echo "Please enter your name:"
read name
echo "Please enter your email:"
read email

git config --get user.name "$name"
git config --get user.email "$email"
