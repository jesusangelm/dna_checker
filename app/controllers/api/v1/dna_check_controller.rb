class Api::V1::DnaCheckController < ApplicationController
  require_relative File.expand_path('lib/dna_checker.rb')

  def mutant
    result = DnaChecker.mutant?(params[:dna])

    DnaLog.find_or_create_by(sample: params[:dna].to_s, mutant: result)
    render json: { mutant: result }, status: result ? 200 : 403
  end

  def stats
    stats = DnaLog.stats
    render json: stats, status: 200
  end
end
