require "extract_ticket_numbers/version"
require 'csv'

module ExtractTicketNumbers

  def self.add_to_csv(in_path, out_path = out_path_from(in_path))
    CSV.open(out_path, "wb", col_sep: ';') do |out_row|
      CSV.foreach(in_path, col_sep: ';', headers: false) do |in_row|
        tickets = in_row.to_s.scan(/[a-zA-Z]+\-[0-9]+/)
        in_row.concat tickets
        out_row << in_row
      end
    end
  end

  def self.out_path_from(in_path)
    File.join(File.dirname(in_path), File.basename(in_path, '.csv') + '-with_ticket_numbers.csv')
  end
end
