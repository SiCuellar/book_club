require 'rails_helper'


describe Book, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
  end


  describe 'Relationship' do
    it { should have_many(:author) }
  end
end
