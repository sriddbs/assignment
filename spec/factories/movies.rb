FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "#{FFaker::Movie.unique.title} #{n}" }
    plot  FFaker::Lorem.paragraph
  end
end
