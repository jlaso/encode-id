require_relative 'encode_id'


tool = EncodeId.new()

id = 1234

eid = tool.encode(id)

print "#{id} = #{eid}\n"

_id = tool.decode(eid)

print "#{eid} = #{_id}\n"

print "Max ID doable is #{tool.max_id()} #{tool.max_digits}"
