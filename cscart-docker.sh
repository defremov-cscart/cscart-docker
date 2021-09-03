#!/bin/bash

  setup() {
echo setup
  }

  shutdown() {
echo shutdown
  }

  start() {
echo start
  }

  stop() {
echo stop
  }

  down() {
echo down
  }

  backup() {
echo backup
  }

  restore() {
echo restore
  }

  echo_warning() {
    echo "
      WARNING! $1"
  }

  echo_help() {
    echo "
      Usage: ./cscart-docker.sh [option]
      Flags:
          --help | -h    Print help
      Arguments:
      	  start          Start container
      	  stop           Stop and keep container
      	  restart        Restart container
      	  down           Stop and remove container
      	  shutdown       Stop and remove container, clear volumes
      	  backup         Backup container
      	  restore        Restore container"
      exit 0
  }

case "$1" in
    setup)
        setup
        ;;
    start)
	start
        ;;
    stop)
        stop
        ;;
    restart)
        down
        start
        ;;
    down)
        down
        ;;
    shutdown)
        shutdown
        ;;
    backup)
        backup
        ;;
    restore)
        restore
        ;;
    --help | -h)
        echo_help
        ;;
    *)
        echo "Invalid option detected: $1"
        echo_help
        exit 1
        ;;
esac
