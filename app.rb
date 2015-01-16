require('./lib/contact')
require('./lib/phone')
require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/contacts') do
  @contact_name = params.fetch('contact')
  Contact.new({:contact_name => @contact_name}).save()
  @contacts = Contact.all()
  erb(:index)
end

get('/contacts/:id') do
  @contacts = Contact.find(params.fetch('id').to_i())
  @phone_numbers = Phone.all()
  erb(:contacts)
end

post('/numbers') do
  @new_number = params.fetch('number')
  @phone_numbers = Phone.new({:phone_number => @new_number})
  @contacts = Contact.find(params.fetch('contact_id').to_i())
  @contacts.add_number(@new_number)
  @phone_numbers = Phone.all()
  erb(:contacts)
end
