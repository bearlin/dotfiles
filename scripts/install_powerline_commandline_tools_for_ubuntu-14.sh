#!/bin/bash

sudo apt-get install python-pip git
pip install --user git+git://github.com/Lokaltog/powerline

echo "The powerline command line tools are installed to ~/.local/bin, so make"
echo "sure this path already added to your ~/.bashrc"
