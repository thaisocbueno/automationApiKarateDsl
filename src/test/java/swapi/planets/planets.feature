Feature: Planets

  Background:
    * url baseUrl

  Scenario: get all planets
    * def totalPlanets = 60
    * def namePlanet = ['Tatooine','Alderaan','Yavin IV','Hoth','Dagobah','Bespin','Endor','Naboo','Coruscant','Kamino']

    Given path 'planets'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match $.count == totalPlanets
    And match $.next contains '?page'
    And match $.previous == null
    And match $.results == '#[_ > 0]'
    And match $.results == '#[]'
    And match $.results..name == namePlanet

  Scenario: get planet from id 3
    * def infoPlanet = read('infoPlanet3.json')
    Given path 'planets/3'
    When method get
    Then status 200
    And match responseType == 'json'
    And match $.name == infoPlanet.name
    And match $.population == infoPlanet.population
    And match $.residents != '#[_ > 0]'
    And match $.url contains '3'