# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Temmy' }
    email { 'temmy@mail.com' }
    password { 'root123' }
    password_confirmation { 'root123' }
  end
end
