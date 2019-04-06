require 'rails_helper'

RSpec.describe Library, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:content_id) }
  it { should validate_presence_of(:content_type) }
  it { should validate_presence_of(:validity_starts_on) }
  it { should validate_presence_of(:validity_expires_on) }
  it { should belong_to(:user) }
  it { should belong_to(:content) }
end
