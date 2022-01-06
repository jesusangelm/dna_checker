require 'rails_helper'
require 'dna_checker'

RSpec.describe 'DnaCheker lib', type: :lib do
  describe 'can' do
    it 'check if a string have 4 nitrogenous base repeated sequentially' do
      result1 = DnaChecker.repeated_letter?('ATGCGA')
      result2 = DnaChecker.repeated_letter?('CCCCTA')

      expect(result1).to eq(false)
      expect(result2).to eq(true)
    end

    it 'extract the columnns from a multidimentional array' do
      dna = %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG]
      columns_dna = %w[ACTACT TATGCC GGAACA CTTACC GGGGTT ACTGAG]

      verticals = DnaChecker.generate_verticals(dna)

      expect(verticals).to eq(columns_dna)
    end

    it 'extract the diagonals from a multidimentional array' do
      dna = %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG]
      diag_dna = [%w[C C],
                  %w[A C A],
                  %w[T G C C],
                  %w[C T A C T],
                  %w[A A A A T G],
                  %w[T G T G A],
                  %w[G T G G],
                  %w[C G T],
                  %w[G C],
                  %w[A T],
                  %w[G T C],
                  %w[T G C A],
                  %w[C G A C C],
                  %w[A G T A C T],
                  %w[G T A G C],
                  %w[C G T A],
                  %w[G A T],
                  %w[T C]]
      diagonals = DnaChecker.generate_diagonals(dna)

      expect(diagonals).to eq(diag_dna)
    end

    it 'count repeated sequences of nitrogenous base found in a dna sample' do
      dna1 = %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG]
      dna2 = %w[ATGCGA CAGTGC TTATTT AGACGG GCGTCA TCACTG]

      result1 = DnaChecker.count_sequence(dna1)
      result2 = DnaChecker.count_sequence(dna2)

      expect(result1).to eq(1)
      expect(result2).to eq(0)
    end

    it 'filter diagonals sequences' do
      diag_dna = [%w[C C],
                  %w[A C A],
                  %w[T G C C],
                  %w[C T A C T],
                  %w[A A A A T G],
                  %w[T G T G A],
                  %w[G T G G],
                  %w[C G T],
                  %w[G C],
                  %w[A T],
                  %w[G T C],
                  %w[T G C A],
                  %w[C G A C C],
                  %w[A G T A C T],
                  %w[G T A G C],
                  %w[C G T A],
                  %w[G A T],
                  %w[T C]]
      filtered_diag_dna = %w[TGCC CTACT AAAATG TGTGA GTGG TGCA CGACC AGTACT GTAGC CGTA]

      result = DnaChecker.filter_diag_seq(diag_dna)
      expect(result).to eq(filtered_diag_dna)
    end

    it 'check if a dna is mutant' do
      dna1 = %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG]
      dna2 = %w[ATGCGA CAGTGC TTATTT AGACGG GCGTCA TCACTG]

      result1 = DnaChecker.mutant?(dna1)
      result2 = DnaChecker.mutant?(dna2)

      expect(result1).to eq(true)
      expect(result2).to eq(false)
    end
  end
end
