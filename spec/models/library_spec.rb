require 'rails_helper'

RSpec.describe Library, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:validity_starts_on) }
  it { should validate_presence_of(:validity_expires_on) }
  it { should belong_to(:user) }
  it { should have_many(:library_contents) }
  it { should have_many(:movies).through(:library_contents).source(:content)}
  it { should have_many(:seasons).through(:library_contents).source(:content)}
end
