FactoryBot.define do
  factory :comment do
    text { 'This is a comment.' }
    post
    user
  end
end
