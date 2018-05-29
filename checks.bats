#! /usr/bin/env bats

# Variable SUT_IP should be set outside this script and should contain the IP
# address of the System Under Test.

# Tests

@test 'Wsgi answers to a request' {
  run curl -i -X HEAD ${SUT_IP}:6017
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ 'HTTP/1.1 403 FORBIDDEN' ]]
}
