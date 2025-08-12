#!/bin/bash
# start-monitoring.sh

echo "🚀 모니터링 시스템 시작..."

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
- Grafana: http://localhost:3000 (admin / ${GRAFANA_PASSWORD:-admin123})
- Alertmanager: http://localhost:9093

Grafana 대시보드 추가:
1. Grafana 접속
2. Dashboard > Import
3. ID 입력: 1860 (Node Exporter Full)
"