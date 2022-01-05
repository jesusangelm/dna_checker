require 'rails_helper'
require 'dna_checker'

RSpec.describe 'DnaCheker lib', type: :lib do
  describe 'can' do
    it 'check if a dna is mutant' do
      dna_1 = ['ATGCGA', 'CAGTGC', 'TTATGT', 'AGAAGG', 'CCCCTA', 'TCACTG']
      dna_2 = ['ATGCGA', 'CAGTGC', 'TTATGT', 'AGAAAG', 'CCACTA', 'TCACTG']

      result1 = DnaChecker.mutant?(dna_1)
      result2 = DnaChecker.mutant?(dna_2)

      expect(result1).to eq(true)
      expect(result2).to eq(false)
    end
  end
end
