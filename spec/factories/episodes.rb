FactoryBot.define do
  factory :episode do
    sequence(:title) { |n| "#{FFaker::Movie.unique.title} #{n}" }
    plot  FFaker::Lorem.paragraph
    sequence(:number)
  end
end
