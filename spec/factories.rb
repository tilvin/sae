FactoryGirl.define do

  factory :port do
    name 'Benghazi'
    latitude 32.1166
    longitude 20.0833
  end

  factory :port2, class: Port do
    name 'Benghazi 2'
    latitude 33.1166
    longitude 23.0833
  end

  factory :port3, class: Port do
    name 'Benghazi 3 '
    latitude -52.1166
    longitude 40.0833
  end

  factory :cargo do
    name 'tea'
    port { Port.last }
    volume 950
    date { 10.days.since }
  end

  factory :ship do
    name 'ship'
    hold_capacity 1000
  end

  factory :raid do
  end
end

