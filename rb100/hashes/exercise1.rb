family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

new = family.select do
 |fam, name| if fam == :sisters || fam == :brothers
  then puts name
  end
end
