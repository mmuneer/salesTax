#parses the input string and create a hash object with values: name,price,quantity
module Input
  def self.parse(str)
    output = {}
    output[:quantity] = str.split().first()
    tokens = str.split(/ at /)
    output[:price] = tokens.last().strip()
    output[:name] = tokens.first().split(output[:quantity]).last().strip()  
    output
  end
end