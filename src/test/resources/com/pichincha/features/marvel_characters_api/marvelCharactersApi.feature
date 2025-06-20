@REQ_HU-CTN-3012 @HU3012 @marvel_characters_api @Agente2 @E2 @iniciativa_marvel
Feature: HU-CTN-3012 Escenarios API de personajes de Marvel (microservicio para gestión de personajes)
  Background:
    * def generarHeaders =
      """
      function() {
        return {
          "Content-Type": "application/json"
        };
      }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @obtenerPersonajes @exitoso200
  Scenario: T-API-HU-CTN-3012-CA01-Obtener todos los personajes 200 - karate
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    When method GET
    Then status 200
    # And match response == []

  @id:3 @obtenerPersonajePorId @noExiste404
  Scenario: T-API-HU-CTN-3012-CA03-Obtener personaje por ID no existe 404 - karate
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/999'
    When method GET
    Then status 404
    # And match response == karate.read('classpath:data/marvel_characters_api/response_character_not_found.json')

  @id:5 @crearPersonaje @nombreDuplicado400
  Scenario: T-API-HU-CTN-3012-CA05-Crear personaje nombre duplicado 400 - karate
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    * def jsonData = karate.read('classpath:data/marvel_characters_api/request_create_character_duplicate.json')
    And request jsonData
    When method POST
    Then status 400
    # And match response == karate.read('classpath:data/marvel_characters_api/response_character_duplicate.json')

  @id:6 @crearPersonaje @faltanCampos400
  Scenario: T-API-HU-CTN-3012-CA06-Crear personaje faltan campos requeridos 400 - karate
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    * def jsonData = karate.read('classpath:data/marvel_characters_api/request_create_character_missing_fields.json')
    And request jsonData
    When method POST
    Then status 400
    # And match response == karate.read('classpath:data/marvel_characters_api/response_character_missing_fields.json')

  @id:8 @actualizarPersonaje @noExiste404
  Scenario: T-API-HU-CTN-3012-CA08-Actualizar personaje no existe 404 - karate
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/999'
    * def jsonData = karate.read('classpath:data/marvel_characters_api/request_update_character.json')
    And request jsonData
    When method PUT
    Then status 404
    # And match response == karate.read('classpath:data/marvel_characters_api/response_character_not_found.json')
