#!/bin/bash

set -eu

readonly DIST_DIR="dist"

usage() {
  cat <<EOF
Usage:
    $(basename ${0}) [command]

Command:
    debug       debug build
    release     release build
    clean       clean dist directory
EOF
}

build() {

  if [ ! -e $DIST_DIR ]; then
    mkdir $DIST_DIR
  fi
  cd $DIST_DIR
  cmake .. -DCMAKE_BUILD_TYPE=${1}
  make
}

parse_args() {
  if [[ $# -lt 1 ]]; then
    usage
    exit 1
  fi

  case ${1} in
    debug)
      build "Debug"
      ;;

    release)
      build "Release"
      ;;

    clean)
      if [[ -e $DIST_DIR && -d $DIST_DIR ]]; then
        rm -rf $DIST_DIR
      fi
      echo "done"
      ;;

    *)
      echo -e "\033[0;31m[ERROR] Invalid command '${1}'\033[0;39m"
      usage
      exit 1
      ;;
  esac
}

main() {
  parse_args $*
}

main $*
