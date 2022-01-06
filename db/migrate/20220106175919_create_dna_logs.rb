class CreateDnaLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dna_logs do |t|
      t.string :sample, null: false
      t.boolean :mutant

      t.timestamps
    end
  end
end
