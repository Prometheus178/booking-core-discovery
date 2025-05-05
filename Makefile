check:
	docker exec -it kafka /usr/bin/kafka-console-consumer --bootstrap-server localhost:9092 --topic pre-listing-place-event --from-beginning