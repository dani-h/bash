#!/usr/bin/env bash

read -p "Install jscs?"                                 PARAM_JSCS
read -p "Install jshint?"                               PARAM_JSHINT

read -p "Install Typescript? [y/n]"                     PARAM_TYPESCRIPT
read -p "Install clausreinke/typescript-tools? [y/n]"   PARAM_TS_TOOLS
read -p "Install vvakame/typescript-formatter? [y/n]"   PARAM_TS_FORMATTER


case $PARAM_JSCS in
    y|Y )
        npm install -g jscs;;
esac

case $PARAM_JSHINT in
    y|Y )
        npm install -g jshint;;
esac

case $PARAM_TYPESCRIPT in
    y|Y )
        npm install -g typescript;;
esac

case $PARAM_TS_TOOLS in
    y|Y )
        npm install -g clausreinke/typescript-tools;;
esac

case $PARAM_TS_FORMATTER in
    y|Y )
        npm install -g typescript-formatter;;
esac
