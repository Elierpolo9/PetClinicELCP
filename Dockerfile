FROM java:8
WORKDIR /
ADD target/spring-petclinic-1.5.1.jar .
EXPOSE 8080
CMD java - jar spring-petclinic-1.5.1.jar