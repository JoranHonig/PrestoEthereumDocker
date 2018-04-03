from smizy/presto:0.197-alpine

RUN apk update \
    && apk --no-cache add git \
    maven \
    openjdk8-jre \
    openjdk8
    
RUN git clone https://github.com/xiaoyao1991/presto-ethereum.git /tmp/presto-ethereum
RUN mvn clean package -f /tmp/presto-ethereum/pom.xml

COPY ethereum.properties /usr/local/presto-server-0.197/etc/catalog/ethereum.properties

RUN mkdir -p /usr/local/presto-server-0.197/plugin/ethereum
##    && mv /tmp/presto-ethereum/target/presto-ethereum*-plugin.tar.gz \ 
##    /usr/local/presto-server-0.197/plugin/ethereum/presto-ethereum.tar.gz

RUN tar xfz /tmp/presto-ethereum/target/presto-ethereum*-plugin.tar.gz -C \
    /usr/local/presto-server-0.197/plugin/ethereum --strip-components 1
