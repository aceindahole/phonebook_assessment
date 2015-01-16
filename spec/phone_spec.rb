require('rspec')
require('phone')
require('contact')

describe(Phone) do
  before() do
    Contact.clear()
  end
  
  describe('#phone_number') do
    it('returns the given phone number') do
      test_number = Phone.new({:phone_number => "503 577 1899"})
      expect(test_number.phone_number()).to(eq("503 577 1899"))
    end
  end

  describe('.all') do
    it('shows the current array of added phone numbers') do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the phone number to the array of previously saved phone numbers') do
      test_number = Phone.new({:phone_number => "503 577 1899"})
      test_number.save()
      expect(Phone.all()).to(eq([test_number]))
    end
  end

  describe('.clear') do
    it('empties out all of the saved phone numbers') do
      Phone.new({:phone_number => "503 577 1899"}).save()
      Phone.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

end
