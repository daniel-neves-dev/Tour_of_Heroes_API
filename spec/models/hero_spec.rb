require 'rails_helper'

RSpec.describe Hero, type: :model do
  context 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:token)}
    it {should validate_length_of(:token).is_at_least(5)}
  end
end

