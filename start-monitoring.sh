#!/bin/bash

echo "🚀 모니터링 시스템 시작..."

# .env 파일 로드
source .env

# Alertmanager config에 Webhook URL 주입
cp alertmanager/config.yml alertmanager/config.yml.tmp
sed -i "s|SLACK_WEBHOOK_URL_PLACEHOLDER|${SLACK_WEBHOOK_URL}|g" alertmanager/config.yml.tmp
mv alertmanager/config.yml.tmp alertmanager/config.yml

# Docker Compose 실행
docker compose up -d

echo "⏳ 서비스 시작 대기 중..."
sleep 10

# 상태 확인
echo "📊 서비스 상태:"
docker compose ps

echo "
✅ 모니터링 시스템 시작 완료!

접속 정보:
- Prometheus: http://localhost:9090
- Grafana: http://localhost:3014 (${GRAFANA_USER} / ${GRAFANA_PASSWORD})
- Alertmanager: http://localhost:9093
"
