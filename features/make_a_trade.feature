Feature: Make a trade / Open position

  Background:
    Given Initialize make_trade API method

  Scenario: Make a trade
    When I send a POST request with the following body:
    """
    {
      "productId": "26630",
      "investingAmount": {
                            "currency": "EUR",
                            "decimals": 2,
                            "amount": "200.00"
                          },
      "leverage": 2,
      "direction": "BUY"
    }
    """
    Then response status code should be 400
    And response headers should be in place
    And response body should have next structure:
#  """
#  {
#    "id": "98922f1a-4c10-4635-a9e6-ae19ddcd12b4",
#    "positionId": "4c58a0b2-ea78-46a0-ac21-5a8c22d527dc",
#    "product": {
#        "securityId": "26623",
#        "symbol": "IM.AS",
#        "displayName": "IMTECH"
#    },
#    "investingAmount": {
#        "currency": "BUX",
#        "decimals": 2,
#        "amount": "200.00"
#}, "price": {
#        "currency": "EUR",
#        "decimals": 3,
#        "amount": "0.567"
#    },
#    "leverage": 1,
#    "direction": "BUY",
#    "type": "OPEN",
#    "dateCreated": 1405515165705
#}
#  """
And