FROM local-alpine-jdk8-maven:latest as temp

WORKDIR /home/admin
RUN git clone https://github.com/yanglch/demo.git && cd demo && mvn package -Dmaven.test.skip=true


FROM local-alpine-jdk8-maven:latest

WORKDIR /home/admin
COPY --from=temp /home/admin/demo/target/demo.jar /home/admin/demo
RUN java -jar ./demo/demo.jar