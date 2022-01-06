require 'rails_helper'

RSpec.describe 'DnaCheckController', type: :request do
  describe 'POST /mutant' do
    it 'returns http 200 ok for a mutant' do
      headers = { 'ACCEPT' => 'application/json' }
      payload = { 'dna' => %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG] }
      post '/mutant', params: payload, headers: headers
      expect(response).to have_http_status(:success)
    end

    it 'returns http 403 forbidden for a human' do
      headers = { 'ACCEPT' => 'application/json' }
      payload = { 'dna' => %w[ATGCGA CAGTGC TTATTT AGACGG GCGTCA TCACTG] }
      post '/mutant', params: payload, headers: headers
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'GET /stats' do
    it 'returns http 200 ok' do
      DnaLog.create(sample: %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG], mutant: false)
      DnaLog.create(sample: %w[ATGCGA CAGTGC TTATTT AGACGG GCGTCA TCACTG], mutant: false)
      headers = { 'ACCEPT' => 'application/json' }
      get '/stats', headers: headers
      
      expect(response).to have_http_status(:success)
    end
  end
end
