# Account represents a simple bank account with a unique account number,
# account holder's name, and balance. It supports deposit and withdrawal
# operations and auto-generates sequential account numbers for each new account.
# (Using class variable beacause i have less idea till now about class instance var)
class Account
  attr_reader :name, :account_no, :balance
  attr_writer :balance
  @@next_account_number = 1

  def initialize(name, balance)
    @name = name
    @balance = balance.to_i
    @account_no = @@next_account_number
    @@next_account_number = account_no + 1
  end

  def transfer(to_account, amount)
    withdraw(amount)
    to_account.deposit(amount)
  end

  protected

  def deposit(amount)
    @balance += amount.to_i
    @balance
  end

  private

  def withdraw(amount)
    @balance -= amount.to_i
    @balance
  end
end

input = ARGV
if input[0].nil?
  print 'Please provide an input'
else
  acc1 = Account.new(input[0].split(':')[0], input[0].split(':')[1])
  acc2 = Account.new(input[1].split(':')[0], input[1].split(':')[1])
  amount = input[2].split(':')[1]

  acc1.transfer(acc2, amount)

  puts "Account number: #{acc1.account_no}"
  puts "Account holder name: #{acc1.name}"
  puts "Account balance: #{acc1.balance}\n\n"

  puts "Account number: #{acc2.account_no}"
  puts "Account holder name: #{acc2.name}"
  puts "Account balance: #{acc2.balance}"
end
