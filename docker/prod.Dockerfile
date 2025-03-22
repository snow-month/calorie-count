FROM alpine:latest

RUN apk add git openjdk17

RUN git clone https://github.com/snow-month/calorie-count.git

WORKDIR /calorie-count

RUN git checkout main

RUN ./mvnw clean package && cp target/calorie-count-*.jar ./service.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "service.jar"]