require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

def convert_to_decimal(rate)
  rate.to_f / 100
end

def convert_to_months(years)
  years.to_i * 12
end

def calculate_monthly_rate(annual_rate)
  annual_rate.to_i / 12
end

prompt("Hello, welcome to the Home Mortgage Calculator!")

prompt('Please enter your name:')
name = gets().chomp()

prompt("Ok #{name}, lets get started. Enter a loan amount:")
loan_amount = gets().chomp().to_i

prompt("Great, now enter the APR as a %:")
annual_rate = gets().chomp()
annual_decimal_rate = convert_to_decimal(annual_rate)

prompt("Almost finished #{name}. Now enter the loan duration(years):")
loan_duration_years = gets().chomp()
loan_duration_months = convert_to_months(loan_duration_years)

monthly_interest_rate = calculate_monthly_rate(annual_decimal_rate)



monthly_payment = (loan_amount / loan_duration_months) + (monthly_interest_rate * loan_amount)

prompt("#{name}, your monthly payment is: $#{monthly_payment}")