hash = {key1: 1, key2: 2, key3: 3}
new_hash = { key4: 4 }
puts new_hash.merge(hash)
puts hash

hash = {key1: 1, key2: 2, key3: 3}
new_hash = { key4: 4 }
puts hash.merge!(new_hash)
puts hash
