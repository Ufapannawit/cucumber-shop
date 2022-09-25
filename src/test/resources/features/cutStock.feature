Feature: Cut Stock
  The system correctly cuts stock out of bought products

  Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Jelly" with price 10.00 and stock of 150 exists

  Scenario: Cut stock
    When I buy "Jelly" with quantity 10
    Then total should be 100.00
    Then quantity remaining in stock of "Jelly" should be 140

  Scenario Outline: Cut stock in table
    When I buy <product> with quantity <quantity>
    Then quantity remaining in stock of <product> should be <quantity_in_stock>
    Examples:
      | product       | quantity      | quantity_in_stock     |
      | "Bread"       | 1             | 4                     |
      | "Jam"         | 2             | 8                     |
      | "Jelly"       | 10            | 140                    |
