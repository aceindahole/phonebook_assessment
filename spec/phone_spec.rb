require('rspec')
require('phone')
require('contact')

describe(Phone) do

  describe('#phone_number') do
    it('returns the given phone number') do
      test_number = Phone.new({:phone_number => "503 577 1899"})
      expect(test_number.phone_number()).to(eq("503 577 1899"))
    end
  end


end
