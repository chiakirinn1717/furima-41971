FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'Passw0rd' }
    password_confirmation { password }
    sei { '山田' }
    mei { '太郎' }
    sei_kana { 'ヤマダ' }
    mei_kana { 'タロウ' }
    birthday { Faker::Date.birthday }
  end
end
