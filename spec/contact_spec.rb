require('rspec')
require('contact')
require('phone')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#contact_name') do
    it('returns the name of the contact') do
      test_contact = Contact.new({:contact_name => "Tyler Brown"})
      expect(test_contact.contact_name()).to(eq("Tyler Brown"))
    end
  end

  describe('.all') do
    it('shows the current array of added contacts') do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the contact name to the array of previously saved contact names') do
      test_contact = Contact.new({:contact_name => "Tyler Brown"})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe('.clear') do
    it('empties out all of the saved contacts') do
      Contact.new({:contact_name => "Tyler Brown"}).save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('#add_number') do
    it('adds a new phone number with Phone class through the Contact class') do
      test_contact = Contact.new({:contact_name => "Tyler Brown"})
      test_number = Phone.new({:phone_number => "503 577 1899"})
      test_contact.add_number(test_number)
      expect(test_contact.new_number()).to(eq([test_number]))
    end
  end

end
