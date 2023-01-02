FROM registry.access.redhat.com/ubi8/openjdk-11
RUN mvn "io.quarkus:quarkus-maven-plugin:2.3.0.Final:create" \
  -DprojectGroupId="com.redhat.developers" \
  -DprojectArtifactId="tutorial-app" \
  -DprojectVersion="1.0-SNAPSHOT" \
  -DclassName="HelloResource" \
  -Dpath="hello" 

RUN cd tutorial-app && mvn package 

EXPOSE 8080
USER 1001

CMD ["java", "-jar", "/home/jboss/tutorial-app/target/quarkus-app/quarkus-run.jar"]



