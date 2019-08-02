FactoryBot.define do
  factory :user_child do
    name_kanji_sei { "MyString" }
    name_kanji_mei { "MyString" }
    name_kana_sei { "MyString" }
    name_kana_mei { "MyString" }
    user_id { 1 }
  end
end
