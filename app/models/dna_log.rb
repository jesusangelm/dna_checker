class DnaLog < ApplicationRecord
  validates :sample, presence: true

  def self.stats
    mutants = DnaLog.where(mutant: true).count
    humans = DnaLog.where(mutant: false).count
    ratio = mutants / humans
    { count_mutant_dna: mutants, count_human_dna: humans, ratio: ratio }
  end
end
