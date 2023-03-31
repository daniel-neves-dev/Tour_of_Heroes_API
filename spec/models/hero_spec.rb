require 'rails_helper'

RSpec.describe Hero, type: :model do
  subject{Hero.new(name: "Chun Li", token: "token5000")}
  context 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:token)}
    it {should validate_length_of(:token).is_at_least(5)}
    it {should validate_uniqueness_of(:name).scoped_to(:token).case_insensitive}
  end
end

