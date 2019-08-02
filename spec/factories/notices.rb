FactoryBot.define do
  factory :notice do
    user_id { 1 }
    admin_id { 1 }
    notice_title { "MyString" }
    notice_text { "MyText" }
    favorites_count { 1 }
  end
end
