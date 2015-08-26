require('spec_helper')

describe(Ingredient) do
  describe('.find') do
    it('finds an ingredient by its id') do
      test = Ingredient.create({:name => 'salt'})
      expect(Ingredient.find(test.id)).to(eq(test))
    end
  end
end
