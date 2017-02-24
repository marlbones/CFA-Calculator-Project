#Create Atm class and it's attributes
class Atm
  def initialize(current_cash)
    @current_cash = current_cash
  end
  attr_accessor :current_cash

#Method within Atm class to dispense money.
  def dispense(amount)
    if @current_cash > amount
      @current_cash = @current_cash - 100
      true
    else
      false
    end
  end
end

#Create Account class and it's attributes
class Account
  def initialize(balance)
    @balance = balance
    @pin = 1234
  end
  attr_accessor :balance, :pin

#Method within Account class that withdraws money
  def withdraw(atm, amount)
    if @balance >= amount
      result = atm.dispense(amount)
      if result == true
        @balance = @balance - amount
        puts "#{amount} has been dispensed"
        puts "Your new amount is #{@balance}"
      else
        puts "Not enough money in ATM"
      end
    else
      puts "Not enough money in your account"
    end
  end

#Method within account class that deposits money
  def deposit(atm, amount)
    atm.current_cash += amount
    @balance = @balance + amount
    puts "#{amount} deposited in your account. You now have #{@balance} in your account"
  end

#Method within account class that checks balance
  def check_balance(atm)
    puts @balance
  end
end

#Method within account class that performs logic of program
  def atm_access(marlon, broadway_atm)
    system('clear')
    puts 'Welcome to ATM'
    puts 'Please enter your pin'
    insert = gets.chomp.to_i

    if insert == marlon.pin
      loop do
        puts 'Would you like to:
        1. Withdraw
        2. Deposit
        3. Check balance
        4. Exit'

        input = gets.chomp.to_i
        case input
        when 1
          puts 'How much do you want to withdraw?'
          withdrawal_amount = gets.chomp.to_i
          marlon.withdraw(broadway_atm, withdrawal_amount)
        when 2
          puts 'How much do you want to deposit?'
          deposit_amount = gets.chomp.to_i
          marlon.deposit(broadway_atm, deposit_amount)
        when 3
          puts marlon.check_balance(broadway_atm)
        when 4
          exit
        end
      end
      else
        puts 'WRONG!'
      end
  end


#Create classes - attach to variables
marlon = Account.new(1500)
broadway_atm = Atm.new(1000)

atm_access(marlon, broadway_atm)
