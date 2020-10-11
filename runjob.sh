#!/bin/bash

# Runs tests from JMX file, creates results file and reports dashboard
apache-jmeter-3.3/bin/jmeter -n -t tests/$1.jmx -l results/$1Results.jtl -e -o $1-reports

# Print results file
cat results/$1Results.jtl

# Curl back to webhook step in Jenkins pipeline
# Give pipeline the name of the test suite pod
#curl -X POST -d "$HOSTNAME" $1

# Sleep for a few minutes to give pipeline time to retrieve dashboard files
sleep 600