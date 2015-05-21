Feature: Make a trade / Open position

  Background:
    Given Initialize make_trade API method

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
#    And id should be String type and match /.8-.4-.4-.12/ pattern
#    * positionId should be String type and match /.8-.4-.4-.12/ pattern
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
    | 26630         | EUR          | 2            | 200.00     | 2            | BUY           | IM.AS      | IMTECH          | BUX               | 3                 | 0.567          | OPEN     |
