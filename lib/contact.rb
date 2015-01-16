class Contact
  attr_reader(:contact_name, :id, :new_number)
  @@contacts = []

  define_method(:initialize) do |attributes|
    @contact_name = attributes.fetch(:contact_name)
    @new_number = []
    @id = @@contacts.length().+(1)
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_method(:add_number) do |number|
    @new_number.push(number)
  end
end
