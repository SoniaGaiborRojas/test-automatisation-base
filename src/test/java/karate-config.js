function fn() {
  var env = karate.env || 'local';
  var config = {};

  // URL para el microservicio Marvel Characters API
  config.port_marvel_characters_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters';

  // Puedes agregar aquí más configuraciones por entorno si lo necesitas
  if (env == 'dev') {
    config.port_marvel_characters_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters';
  } else if (env == 'qa') {
    config.port_marvel_characters_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters';
  }

  return config;
}
