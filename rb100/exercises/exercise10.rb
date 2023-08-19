h = {a:1, b:2, c:3, d:4}

h[:b]
h[:e] = 5
h.delete_if { |x, y| y < 3.5 }


