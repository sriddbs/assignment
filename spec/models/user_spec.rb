require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should have_many(:purchases) }
  it { should have_many(:libraries) }
  it { should have_many(:library_contents).through(:libraries) }
  it { should have_many(:active_contents).through(:libraries).source(:library_contents) }
end
