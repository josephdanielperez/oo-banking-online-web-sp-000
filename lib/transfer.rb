class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if self.both_valid? && self.status != "complete" && @sender.balance > @amount
       @sender.balance -= @amount
       @receiver.balance += @amount
       self.status = "complete"
    else
      self.reject_transfer
    end
  end

end
