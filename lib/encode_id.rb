class EncodeId
  
  attr_reader :max_digits
  attr_reader :grows

  def initialize(max_digits=6, grows=false)
    @base=[
      'VaRCScev0fNjk9HDGlmTobPq7rIsYtux5yzAgBE4pFihUJnK3LMd1Q6XZ',
      'JK3LMNtuvx5yzABCDE4FGHIP1QRSTUV6XYZabcde0fghijk9lmnopq7rs',
      'STUV6XYZabcde0fghijk9lmK3LMNnopq7rstuvP1QRx5yzABCDE4FGHIJ',
      'P1QRk9lmnopq7rsSTdzABCDEuJK3LMN4FGHe0fghijtvx5yUV6XYZabcI',
      'lmnopDE4FGHe0fghijtuJK3LMNvx5q7rsSTdzABCIPyUV6XYZabc1QRk9',
      'vx5yzABCDE4FGHUV6XYZk9lmnopq7rsP1QRSTde0fghijtuabcIJK3LMN',
      'TdzABCIPyUV6XYZabc1QRk9lmnopDE4FGHe0fghijtuJK3LMNvx5q7rsS',
      'QRSTde0fghijtuabcIJK3LMNvx5yzABCDE4FGHUV6XYZk9lmnopq7rsP1',
      '4FGHe0fghijtP1QRk9lmnopq7rsSTdzABCDEuJK3LMNvx5yUV6XYZabcI',
      'q7rsSTdzABCIPyUV6XYZabc1QRk9lmnopDE4FGHe0fghijtuJK3LMNvx5',
    ]
      @max_digits = max_digits
      @grows = grows
      @base_len = @base.length()
      @n_base = @base[0].length()
  end

  def encode(id)
    if(!@grows && id > max = self.max_id())
      raise "Limit id(#{id}) for #{@max_digits} digits(#{max}) in EncodeId.encode, possible lost of information"
    end
    ret = ''
    aux = id
    bit = 0
    while (@grows && aux) || (@max_digits > bit) do
      a = aux % @n_base
      ret.concat(@base[bit % @base_len][a])
      aux = (aux - a) / @n_base
      bit += 1
    end
    return ret
  end


  def decode(c)
    id = 0
    x = 1
    for bit in 0..c.length() - 1
      v = @base[bit % @base_len].index(c[bit])
      id += v * x
      x *= @n_base
    end
    return id
  end


  def max_alias
    a = ''
    for bit in 0..@max_digits
      a.concat(@base[bit % @base_len][-1])
    end
    return a
  end


  def max_id()
    @n_base.pow(@max_digits)
  end
  
  protected
  
  attr_accessor :base
  attr_accessor :n_base
  attr_accessor :base_len
  
end
