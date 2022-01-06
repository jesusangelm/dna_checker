class DnaChecker
  def self.mutant?(dna)
    counter_seq = 0
    counter_seq += DnaChecker.count_sequence(dna)

    verticals = DnaChecker.generate_verticals(dna)
    counter_seq += DnaChecker.count_sequence(verticals)

    diagonals = DnaChecker.generate_diagonals(dna)
    cleaned_diags = DnaChecker.filter_diag_seq(diagonals)
    counter_seq += DnaChecker.count_sequence(cleaned_diags)

    counter_seq >= 2
  end

  # recibe una string (una row de la matriz o array multidimencional)
  # y verifica si en esa string hay una secuencia de letras repetidas 4 veces.
  # devuelve true si hay una secuencia de letras repetidas, false si no hay ninguna.
  def self.repeated_letter?(string)
    string.scan(/(AAAA|TTTT|GGGG|CCCC)/).any?
  end

  # Genera un nuevo array con las combinaciones de letras verticales en la matriz o array multidimencional
  # posible sustituto: dna.map {|seq| seq.chars}.transpose.map{|seq| seq.join}
  def self.generate_verticals(dna)
    verticals = []
    (0..dna.first.size - 1).each do |i|
      verticals << dna.map { |row| row[i] }.join
    end
    verticals
  end

  # Genera todas las diagonales posibles
  def self.generate_diagonals(dna)
    dna = dna.map(&:chars)

    [dna, dna.map(&:reverse)].each_with_object([]) do |matrix, all_diags|
      ((-matrix.count + 1)..matrix.first.count).each do |offet_index|
        diagonal = []
        matrix.count.times do |row_index|
          col_index = offet_index + row_index
          diagonal << matrix[row_index][col_index] if col_index >= 0
        end
        all_diags << diagonal.compact if diagonal.compact.count > 1
      end
      all_diags
    end
  end

  # Unifica las array de segundo nivel a string y elimina secuencias de base nitrogenada no necesarias.
  def self.filter_diag_seq(diagonals)
    diagonals.map(&:join).filter { |seq| seq.size >= 4 }
  end

  # Verifica y devuelve la cantidad de secuencias iguales encontradas.
  # devuelve 0 si no encontro ninguna secuencia.
  def self.count_sequence(dna)
    dna.map { |seq| DnaChecker.repeated_letter?(seq) }.count(true)
  end
end
