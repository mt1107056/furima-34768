FactoryBot.define do
  factory :user do
    nickname              { 'miho' }
    email                 { 'sample@gmail.com' }
    password              { 'miho1234' }
    password_confirmation { 'miho1234' }
    family_name           { '松島' }
    read_family           { 'マツシマ' }
    first_name            { '美穂' }
    read_first            { 'ミホ' }
    birth                 { '2000-01-01' }
  end
end
