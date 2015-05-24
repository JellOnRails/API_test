Feature: Make a trade / Open position

  Background:
    Given Initialize make_trade API method
    And Initialize headers

  @trade
  Scenario Outline: Make a trade
    When add productId with <productId_val> type String to body request
    * add currency with <currency_val> type String to investingAmount body
    * add decimals with <decimals_val> type Integer to investingAmount body
    * add amount with <amount_val> type String to investingAmount body
    * add leverage with <leverage_val> type Integer to body request
    * add direction with <direction_val> type String to body request
    And send POST request
    Then response status code should be 200
    And response headers should be in place
    And id should be String type and match /.{8}-.{4}-.{4}-.{4}-.{12}/ pattern
    * positionId should be String type and match /.{8}-.{4}-.{4}-.{4}-.{12}/ pattern
    * securityId should be String type, nested to product and have <productId_val> value
    * symbol should be String type, nested to product and have <symbol_val> value
    * displayName should be String type, nested to product and have <displayName_val> value
    * currency should be String type, nested to investingAmount and have <currency_val_resp> value
    * decimals should be Integer type, nested to investingAmount and have <decimals_val> value
    * amount should be String type, nested to investingAmount and have <amount_val> value
    * currency should be String type, nested to price and have <currency_val> value
    * decimals should be Integer type, nested to price and have <decimals_val_resp> value
    * amount should be String type, nested to price and have <amount_val_resp> value
    * leverage should be Integer type and have <leverage_val> value
    * direction should be String type and have <direction_val> value
    * type should be String type and have <type_val> value
    * dateCreated should be Integer type

    Examples: Parameters value
    | productId_val | currency_val | decimals_val | amount_val | leverage_val | direction_val | symbol_val | displayName_val | currency_val_resp | decimals_val_resp | amount_val_resp | type_val |
    | 26630         | BUX          | 2            | 200.00     | 2            | BUY           | IM.AS      | IMTECH          | BUX               | 3                 | 0.567           | OPEN     |
    | 26609         | EUR          | 2            |  50.00     | 2            | BUY           | IM.AS      | IMTECH          | BUX               | 3                 | 0.567           | OPEN     |

    @error
    Scenario Outline: Error codes and messages
      When add productId with <productId_val> type String to body request
      * add currency with <currency_val> type String to investingAmount body
      * add decimals with <decimals_val> type Integer to investingAmount body
      * add amount with <amount_val> type String to investingAmount body
      * add leverage with <leverage_val> type Integer to body request
      * add direction with <direction_val> type String to body request
      And send POST request
      Then response status code should be <statusCode>
      And message should be String type
      * developerMessage should be String type
      * errorCode should be String type and have <buxErrorCode> value

      Examples: Trading error
        | productId_val | currency_val | decimals_val | amount_val | leverage_val | direction_val | statusCode | buxErrorCode |
        | 26630         | EUR          | 2            |  50.00     | 2            | BUY           | 500        | CORE_011     |
        | 26609         | BUX          | 2            |  50.00     | 2            | BUY           | 400        | TRADING_007  |
        | 26609         | BUX          | 2            |  50.00     | 2            | BUY           | 401        | CORE_23      |
        | 26609         | BUX          | 2            |  50.00     | 99           | BUY           | 400        | TRADING_008  |
        | 26609         | BUX          | 2            |  50.00     | 2            | BUY           | 400        | TRADING_010  |
        | 26609         | BUX          | 2            |  1.00      | 2            | BUY           | 400        | TRADING_011  |
        | 2660912       | BUX          | 2            |  1.00      | 2            | BUY           | 400        | TRADING_006  |

      Examples: Unexpecting errors
        | productId_val | currency_val | decimals_val | amount_val | leverage_val | direction_val | statusCode | buxErrorCode |
        | 26630         | BUX          | 2            |  50.00     | 2            | UP            | 500        | CORE_002     |
        | 26609         | EUR          | 2            |  50.00     | 2            | BUY           | 500        | CORE_007     |

  @error_1
  Scenario: Absent request body
    When Remove body from request
    And send POST request
    Then response status code should be 500
    And message should be String type
    * developerMessage should be String type
    * errorCode should be String type and have CORE_002 value
