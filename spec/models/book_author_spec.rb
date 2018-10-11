require 'rails_helper'

describe BookAuthor, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:author_id) }
    it { should validate_presence_of(:book_id) }
  end

  describe 'Relationship' do
    it { should belong_to(:author) }
    it { should belong_to(:book) }
  end
end
