Feature: Get API test demo

  Background:
    * url 'https://reqres.in'
    * header Accept = 'application/json'
    * def getObject = read('classpath:demo/get/get.json')


  @positive
  Scenario: Get a list of users by a specific page
    * def pageNumber = 2
    Given path '/api/users'
    And param page = pageNumber
    When method GET
    Then status 200
    And match $.page == pageNumber
    And match $.per_page == 6
    And assert response.data.length == response.per_page


  @negative
  Scenario: No users when informing an invalid page
    * def pageNumber = 4
    Given path '/api/users'
    And param page = pageNumber
    When method GET
    Then status 200
    And match $.page == pageNumber
    And match $.per_page == 6
    And assert response.data.length == 0


  @positive
  Scenario: Get a valid single user
    * def id = 2
    Given path '/api/users/' + id
    When method GET
    Then status 200
    And match $.data.id == id
    And match $ == getObject.response.user


  @negative
  Scenario: No data when informing an invalid user
    Given path '/api/users/2000'
    When method GET
    Then status 404
    And match $ == {}
