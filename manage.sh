#!/bin/bash
# manage.sh

case "$1" in
  start)
    docker compose up -d
    ;;
  stop)
    docker compose down
    ;;
  restart)
    docker compose restart
    ;;
  logs)
    docker compose logs -f $2
    ;;
  status)
    docker compose ps
    ;;
  reload-prometheus)
    docker compose exec prometheus kill -HUP 1
    ;;
  backup)
    tar -czf monitoring-backup-$(date +%Y%m%d).tar.gz data/
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|logs|status|reload-prometheus|backup}"
    exit 1
    ;;
esac