@positive
Feature: Post API test demo using different ways to get name

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def postObject = read('classpath:demo/post/post.json')
    * def expectedOutput = read('classpath:demo/post/post.json')

    # will be executed 1 time
  Scenario: Post a valid user using name generator with Java
    * def generatedName = Java.type('demo.utils.Utils').nameGenerator();

    Given path '/users'
    * postObject.request.name = generatedName
    And request postObject.request
    When method POST
    Then status 201
    And match response == postObject.response
    And match response.name == generatedName


    # will be executed 3 times
  Scenario Outline: Post a valid user using table
    Given path '/users'
    * postObject.request.name = "<name>"
    And request postObject.request
    When method POST
    Then status 201
    And match response == postObject.response
    And match response.name == "<name>"
    Examples:
      | name     |
      | Neo      |
      | Trinity  |
      | Morpheus |
