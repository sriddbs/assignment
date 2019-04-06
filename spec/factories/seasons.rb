FactoryBot.define do
  factory :season do
    sequence(:title) { |n| "#{FFaker::Movie.unique.title} #{n}" }
    plot  FFaker::Lorem.paragraph
  end
end
