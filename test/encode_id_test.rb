require 'test/unit'
require 'expirable_token'

class EncodeIdTest < Test::Unit::TestCase
  def test_encode_decode
    tool = EncodeId.new()
    id = 1234
    code = tools.encode(id)
    back_id = tools.decode(code)
    assert(back_id, id)
  end
end
