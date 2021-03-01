class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    self.balance += deposit
  end

  def display_balance
    self.balance
  end

  def valid?
    self.status == "open" && self.balance > 0    
  end

end
