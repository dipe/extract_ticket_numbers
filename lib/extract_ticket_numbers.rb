require "extract_ticket_numbers/version"
require 'csv'

module ExtractTicketNumbers

  def self.add_to_csv(in_path, out_path = in_path + '.with_ticket_numbers.csv')
    CSV.open(out_path, "wb", col_sep: ';') do |out_row|
      CSV.foreach(in_path, col_sep: ';', headers: false).each do |in_row|
        ticket = in_row.to_s.scan[/[a-zA-Z]+\-[0-9]+/].join(', ')
        in_row << ticket
        out_row << in_row
      end
    end
  end
end
