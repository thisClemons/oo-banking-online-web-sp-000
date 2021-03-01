require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  @@past_transfers = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.valid? && !Transfer.past_transfers.include?(self)
      # binding.pry
      sender.deposit(-amount)
      receiver.deposit(amount)
      self.status = "complete"
      Transfer.past_transfers << self
    else
      status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def self.past_transfers
    @@past_transfers
  end

end
