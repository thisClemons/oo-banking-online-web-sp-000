class Transfer

  attr_reader :sender, :receiver, :amount, :status

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
      sender.deposit(-amount)
      receiver.deposit(amount)
      status = "complete"
      Transfer.past_transfers << self
    else
      status = "rejected"
      "Transaction rejected. Please check your account balance."

  end

  def self.past_transfers
    @@past_transfers
  end

end
