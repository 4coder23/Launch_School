def word(string)
  if string =~ /lab/
    puts string
  else
    puts "no it's not there"
  end
end

word("laboratory")
word("experiment")
word("Pans Labyrinth")
word("elaborate")
word("polar bear")