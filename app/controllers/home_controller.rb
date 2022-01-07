class HomeController < ApplicationController
  def index
    data = {
      endpoints: [
        { 'name' => 'mutants',
          'description' => 'recibe una muestra de ADN como parametro y responde si es mutante o no',
          'location' => '/mutants',
          'params_example' => { "dna": %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG] },
          'http_method' => 'POST' },
        { 'name' => 'stats',
          'description' => 'devuelve un JSON con las estadisticas de analisis de ADN realizados',
          'location' => '/stats',
          'params_example' => 'no requerido',
          'http_method' => 'GET' }
      ]
    }
    render json: data, status: 200
  end
end
