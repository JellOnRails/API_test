Feature: Authentication

  Background:
    Given Initialize make_trade API method
    And Initialize headers

  @auth_error
  Scenario Outline: Invalid authorization header
    When Set Authorization header with <token>
    And send POST request
    Then response status code should be <statusCode>
    And message should be String type
    * developerMessage should be String type
    * errorCode should be String type and have <buxErrorCode> value

    Examples: Authentication error
      | token   | statusCode | buxErrorCode |
      | invalid | 401        | AUTH_007     |
      | expired | 401        | AUTH_008     |
      | missed  | 401        | AUTH_009     |
