module FormatMedExpResponse

  def self.format_totals(totals)
    formatted = totals.map do |total_data|
      { state:  total_data[0],
        type:   total_data[1],
        total:  total_data[-1]
      }
    end
    formatted
  end

end
