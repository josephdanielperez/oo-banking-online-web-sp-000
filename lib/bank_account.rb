class BankAccount

  attr_reader :name, :balance

  def intiialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

end
