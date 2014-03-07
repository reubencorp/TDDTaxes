require 'csv'
require 'pry'

class Citizen
	
	attr_reader :first_name, :last_name, :annual_income, :tax_paid, :tax_rate

	def initialize(first_name, last_name, annual_income, tax_paid, tax_rate)
		@first_name = first_name
		@last_name = last_name
		@annual_income = annual_income
		@tax_paid = tax_paid
		@tax_rate = tax_rate
    end   

    def tax_refund
      @refund = @tax_paid.to_f - @annual_income.to_f * (@tax_rate * 0.01)
  end
end	

Citizens = []
CSV.foreach('../taxes.csv', headers: true) do |row|
	Citizens<<Citizen.new(row[0], row[1], row[2], row[3], row[4].to_f)
end

Citizens.each do |row|
  if row.tax_refund > 0
    puts "#{row.first_name} #{row.last_name} will receive a tax refund of $#{"%0.2f" % row.tax_refund}" 
  else
  	puts "#{row.first_name} #{row.last_name} will owe a tax amount of $#{"%0.2f" % row.tax_refund.abs}" 
  end
end   	 		