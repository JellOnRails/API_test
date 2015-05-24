
require 'net/http'
require 'json'

PARAMETERS = YAML.load_file 'parameters.yaml'
HEADERS = YAML.load_file 'headers.yaml'
# could be used as alternative way of passing parameters into framework
# BODY = YAML.load_file 'body.yaml'