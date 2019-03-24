require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:price) }
  it { should belong_to(:user) }
  it { should have_many(:purchase_line_items) }
end
