Feature: Make a trade / Open position

  Background:
    Given Initialize make_trade API method

  Scenario: Make a trade
    When I send a post request with the following body:
    """
    {
      "productId": %{ BODY[ 'request' ][ 'productid' ] },
      "investingAmount": {
                            "currency": %{ BODY[ 'request' ][ 'investingamount' ][ 'currency' ] },
                            "decimals": %{ BODY[ 'request' ][ 'investingamount' ][ 'decimals' ] },
                            "amount": %{ BODY[ 'request' ][ 'investingamount' ][ 'amount' ] }
                         },
      "leverage": %{ BODY[ 'request' ][ 'leverage' ] },
      "direction": %{ BODY[ 'request' ][ 'direction' ] }
    }
    """
    Then I should ..


#  Scenario: Test
#    Given Set request body with product ID:
#    """
#    [
#    {
#      "productId": %{ID},
#      "investingAmount": {
#                            "currency": "EUR",
#                            "decimals": 2,
#                            "amount": "200.00"
#                         },
#      "leverage": 2,
#      "direction": "BUY"
#    }
#    ]
#    """
#    When client requests POST /trades
#    Then response should be JSON:
#    """
#    [
#    {
#      "id": "98922f1a-4c10-4635-a9e6-ae19ddcd12b4",
#      "positionId": "4c58a0b2-ea78-46a0-ac21-5a8c22d527dc",
#      "product": {
#                    "securityId": "26623",
#                    "symbol": "IM.AS",
#                    "displayName": "IMTECH"
#                  },
#      "investingAmount": {
#                            "currency": "BUX",
#                            "decimals": 2,
#                            "amount": "200.00"
#                          },
#      "price": {
#                  "currency": "EUR",
#                  "decimals": 3,
#                  "amount": "0.567"
#                },
#      "leverage": 1,
#      "direction": "BUY",
#      "type": "OPEN",
#      "dateCreated": 1405515165705
#    }
#    ]
#    """
