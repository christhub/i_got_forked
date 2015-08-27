require('spec_helper')

describe(Ingredient) do
  describe('.find') do
    it('finds an ingredient by its id') do
      test = Ingredient.create({:name => 'salt'})
      expect(Ingredient.find(test.id)).to(eq(test))
    end
  end
  describe('#name') do
    it('returns an ingredients name') do
      test = Ingredient.create({:name => 'salt'})
      expect(test.name).to(eq('salt'))
    end
  end
end
