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

def validate_number?(num)
  Integer(num) rescue false
end

prompt("Hello, welcome to the Home Mortgage Calculator!")

prompt('Please enter your name:')

name = ''
loop do
  name = gets().chomp()

  if name.empty?
    prompt("Please enter a valid name")
  else
    break
  end
end

prompt("Ok #{name}, lets get started. Enter a loan amount:")
loan_amount = ''
loop do
  loan_amount = gets().chomp()

  if loan_amount.include?(',')
    loan_amount = loan_amount.delete(',').to_f
  end

  if validate_number?(loan_amount)
    break
  else
    prompt("Please enter a valid number for your loan amount:")
  end
end

prompt("Great, now enter the APR as a %:")
annual_decimal_rate = ''
loop do
  annual_rate = gets().chomp()

  if validate_number?(annual_rate)
    annual_decimal_rate = convert_to_decimal(annual_rate)
    break
  else
    prompt("Please enter a valid APR as a percentage:")
  end
end

prompt("Almost finished #{name}. Now enter the loan duration(years):")
loan_duration_years = ''
loan_duration_months = ''
loop do
  loan_duration_years = gets().chomp()

  if validate_number?(loan_duration_years)
    loan_duration_months = convert_to_months(loan_duration_years)
    break
  else 
    prompt("Please enter a valid number (in years):")
  end
end

monthly_interest_rate = calculate_monthly_rate(annual_decimal_rate)

monthly_payment = (loan_amount / loan_duration_months) + (monthly_interest_rate * loan_amount)
monthly_payment = monthly_payment.round(2)

prompt("#{name}, your monthly payment is: $#{monthly_payment}")