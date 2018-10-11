require 'rails_helper'

describe Review, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:review)}
    it { should validate_presence_of(:rating)}
    # it { should validate_numericality_of(:rating)
    #     is_less_than_or_equal_to(5.0)}
  end

  describe 'Relationship' do
    it { should belong_to(:book) }
  end
end
