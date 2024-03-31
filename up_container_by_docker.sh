./gradlew clean bootJar
docker image build -t booking-core-discovery .
docker run -d --hostname discovery --name discovery -p 8761:8761 booking-core-discovery