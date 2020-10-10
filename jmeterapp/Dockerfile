# Use Java 8 slim JRE
FROM openjdk:8-jre-slim
MAINTAINER TestAutomationGuru

# JMeter version
ARG JMETER_VERSION=3.3

# Install few utilities
RUN apt-get clean && \
    apt-get update && \
    apt-get -qy install \
                wget \
                telnet \
                iputils-ping \
                unzip

# Install JMeter
RUN   mkdir /jmeter \
      && cd /jmeter/ \
      && wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz \
      && tar -xzf apache-jmeter-$JMETER_VERSION.tgz \
      && rm apache-jmeter-$JMETER_VERSION.tgz

# ADD all the plugins
# ADD jmeter-plugins/lib /jmeter/apache-jmeter-$JMETER_VERSION/lib

# ADD the sample test
# ADD sample-test sample-test

# Set JMeter Home
ENV JMETER_HOME /jmeter/apache-jmeter-$JMETER_VERSION/

# Add JMeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH

# Copy custom user.properties file for reports dashboard to be generated
COPY user.properties $JMETER_HOME/bin/user.properties

WORKDIR /jmeter

COPY jmeter /jmeter/tests

COPY runjob.sh /jmeter/runjob.sh

RUN chmod 777 -R /jmeter
