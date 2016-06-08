FactoryGirl.define do
  factory :event do
    owner
    sequence(:name) { |i| "イベント名#{i}" }
    sequence(:place) { |i| "イベント開催場所#{i}" }
    sequence(:content) { |i| "イベント本文#{i}" }
    start_time { rand(1..30).days.from_now }
    end_time { start_time + rand(1..30).hours }

    trait :has_invalid_end_time do
      end_time { start_time - rand(1..30).hours }
    end

    trait :has_closed_start_time do
      start_time { rand(-30..-1).days.from_now }
    end
  end
end
