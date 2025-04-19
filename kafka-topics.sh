#!/bin/bash

KAFKA_TOPICS_CMD="/usr/bin/kafka-topics"

# Wait until Kafka is reachable
while ! nc -z kafka 9092; do
  echo "Waiting for Kafka..."
  sleep 2
done

TOPICS=(
  "user-registration-notification"
  "user-registration-requests"
  "user-employee-registration-requests"
  "user-registration-responses"
  "email-notification"
  "notification"
  "reservation-event-request"
  "reservation-update-state-event-request"
  "calendar-update-event-request"
  "user-work-times"
  "reminder-event"
  "analytics-create-project"
  "analytics-create-user"
  "analytics-user-reservation-history"
  "spot-create-event"
)

for topic in "${TOPICS[@]}"; do
  echo "Creating topic: $topic"
  "$KAFKA_TOPICS_CMD" --create \
    --topic "$topic" \
    --bootstrap-server kafka:9092 \
    --replication-factor 1 \
    --partitions 3 \
    --if-not-exists
done