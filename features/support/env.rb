
require 'net/http'
require 'json'

PARAMETERS = YAML.load_file 'parameters.yaml'
HEADERS = YAML.load_file 'headers.yaml'
BODY = YAML.load_file 'body.yaml'