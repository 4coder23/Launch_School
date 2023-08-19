pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog] = 'bowser', 'sparky', 'fido'

p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}
p pets[:dog]