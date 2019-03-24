require 'rails_helper'

RSpec.describe PurchaseLineItem, type: :model do
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:video_quality) }
  it { should validate_presence_of(:content_id) }
  it { should validate_presence_of(:content_type) }
  it { should validate_presence_of(:purchase_id) }
  it { should belong_to(:purchase) }
  it { should belong_to(:content) }
end
