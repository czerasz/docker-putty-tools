#!/bin/bash

script_directory="$( cd "$( dirname "$0" )" && pwd )"
project_directory=$script_directory/..

cd $project_directory

docker build --tag=putty-tools .
