require 'rails_helper'

RSpec.describe DnaLog, type: :model do
  describe 'validations' do
    it 'is invalid if not have a sample' do
      dnalog = DnaLog.create(sample: '', mutant: false)
      expect(dnalog).to_not be_valid
    end

    it 'is valid with a sample present' do
      dnalog = DnaLog.create(sample: %w[ATGCGA CAGTGC TTATTT AGACGG GCGTCA TCACTG], mutant: false)
      expect(dnalog).to be_valid
    end
  end
end
