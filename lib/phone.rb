class Phone
  attr_reader(:phone_number)
  @@numbers = []

  define_method(:initialize) do |attributes|
    @phone_number = attributes.fetch(:phone_number)
  end

  define_singleton_method(:all) do
    @@numbers
  end

  define_method(:save) do
    @@numbers.push(self)
  end

  define_singleton_method(:clear) do
    @@numbers = []
  end

end
