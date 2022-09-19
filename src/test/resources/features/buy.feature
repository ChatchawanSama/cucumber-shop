Feature: Buy products
As a customer
I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "GucciBelt" with price 15000.00 and stock of 10 exists

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    And I buy "GucciBelt" with quantity 2
    Then total should be 30121.00

Scenario: Cut Stock
    When I buy "GucciBelt" with quantity 2
    And  I buy "Bread" with quantity 2
    Then a product "GucciBelt" quantity should be 8
    And a product "Bread" quantity should be 3


Scenario Outline: Buy one product in table
    When I buy <product> with quantity <quantity>
    Then total should be <total>
    Examples:
        | product  | quantity |  total  |
        | "Bread"  |     1    |   20.50 |
        | "Jam"    |     2    |  160.00 |
        | "GucciBelt"     |   10       |      150000.00   |
