# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

CATEGORIES = [
'Arts, crafts, and collectibles',
'Beauty and fragrances',
'Books and magazines',
'Education',
'Electronics and telecom',
'Entertainment and media',
'Food retail and service',
'Gifts and flowers',
'Government',
'Health and personal care',
'Home and garden',
'Pets and animals',
'Services - other',
'Sports and outdoors',
'Travel',
]

ADDRESSES = [
'777 Brockton Avenue, Abington MA 2351',
'30 Memorial Drive, Avon MA 2322',
'250 Hartford Avenue, Bellingham MA 2019',
'700 Oak Street, Brockton MA 2301',
'66-4 Parkhurst Rd, Chelmsford MA 1824',
'591 Memorial Dr, Chicopee MA 1020',
'55 Brooksby Village Way, Danvers MA 1923',
'137 Teaticket Hwy, East Falmouth MA 2536',
'42 Fairhaven Commons Way, Fairhaven MA 2719',
'374 William S Canning Blvd, Fall River MA 2721',
'121 Worcester Rd, Framingham MA 1701',
'677 Timpany Blvd, Gardner MA 1440',
'337 Russell St, Hadley MA 1035',
'295 Plymouth Street, Halifax MA 2338',
'1775 Washington St, Hanover MA 2339',
'280 Washington Street, Hudson MA 1749',
'20 Soojian Dr, Leicester MA 1524',
'11 Jungle Road, Leominster MA 1453',
'301 Massachusetts Ave, Lunenburg MA 1462',
'780 Lynnway, Lynn MA 1905',
'70 Pleasant Valley Street, Methuen MA 1844',
'830 Curran Memorial Hwy, North Adams MA 1247',
'1470 S Washington St, North Attleboro MA 2760',
'506 State Road, North Dartmouth MA 2747',
'742 Main Street, North Oxford MA 1537',
'72 Main St, North Reading MA 1864',
'200 Otis Street, Northborough MA 1532',
'180 North King Street, Northhampton MA 1060',
'555 East Main St, Orange MA 1364',
'555 Hubbard Ave-Suite 12, Pittsfield MA 1201',
'300 Colony Place, Plymouth MA 2360',
'301 Falls Blvd, Quincy MA 2169',
'36 Paramount Drive, Raynham MA 2767',
'450 Highland Ave, Salem MA 1970',
'1180 Fall River Avenue, Seekonk MA 2771',
'1105 Boston Road, Springfield MA 1119',
'100 Charlton Road, Sturbridge MA 1566',
'262 Swansea Mall Dr, Swansea MA 2777',
'333 Main Street, Tewksbury MA 1876',
'550 Providence Hwy, Walpole MA 2081',
'352 Palmer Road, Ware MA 1082',
'3005 Cranberry Hwy Rt 6 28, Wareham MA 2538',
'250 Rt 59, Airmont NY 10901',
'141 Washington Ave Extension, Albany NY 12205',
'13858 Rt 31 W, Albion NY 14411',
'2055 Niagara Falls Blvd, Amherst NY 14228',
'101 Sanford Farm Shpg Center, Amsterdam NY 12010',
'297 Grant Avenue, Auburn NY 13021',
'4133 Veterans Memorial Drive, Batavia NY 14020',
'6265 Brockport Spencerport Rd, Brockport NY 14420',
'5399 W Genesse St, Camillus NY 13031',
'3191 County rd 10, Canandaigua NY 14424',
'30 Catskill, Catskill NY 12414',
'161 Centereach Mall, Centereach NY 11720',
'3018 East Ave, Central Square NY 13036',
'100 Thruway Plaza, Cheektowaga NY 14225',
'8064 Brewerton Rd, Cicero NY 13039',
'5033 Transit Road, Clarence NY 14031',
'3949 Route 31, Clay NY 13041',
'139 Merchant Place, Cobleskill NY 12043',
'85 Crooked Hill Road, Commack NY 11725',
'872 Route 13, Cortlandville NY 13045',
'279 Troy Road, East Greenbush NY 12061',
'2465 Hempstead Turnpike, East Meadow NY 11554',
'6438 Basile Rowe, East Syracuse NY 13057',
'25737 US Rt 11, Evans Mills NY 13637',
'901 Route 110, Farmingdale NY 11735',
'2400 Route 9, Fishkill NY 12524',
'10401 Bennett Road, Fredonia NY 14063',
'1818 State Route 3, Fulton NY 13069',
'4300 Lakeville Road, Geneseo NY 14454',
'990 Route 5 20, Geneva NY 14456',
'311 RT 9W, Glenmont NY 12077',
'200 Dutch Meadows Ln, Glenville NY 12302',
'100 Elm Ridge Center Dr, Greece NY 14626',
'1549 Rt 9, Halfmoon NY 12065',
'5360 Southwestern Blvd, Hamburg NY 14075',
'103 North Caroline St, Herkimer NY 13350',
'1000 State Route 36, Hornell NY 14843',
'1400 County Rd 64, Horseheads NY 14845',
'135 Fairgrounds Memorial Pkwy, Ithaca NY 14850',
'2 Gannett Dr, Johnson City NY 13790',
'233 5th Ave Ext, Johnstown NY 12095',
'601 Frank Stottile Blvd, Kingston NY 12401',
'350 E Fairmount Ave, Lakewood NY 14750',
'4975 Transit Rd, Lancaster NY 14086',
'579 Troy-Schenectady Road, Latham NY 12110',
'5783 So Transit Road, Lockport NY 14094',
'7155 State Rt 12 S, Lowville NY 13367',
'425 Route 31, Macedon NY 14502',
'3222 State Rt 11, Malone NY 12953',
'200 Sunrise Mall, Massapequa NY 11758',
'43 Stephenville St, Massena NY 13662',
'750 Middle Country Road, Middle Island NY 11953',
'470 Route 211 East, Middletown NY 10940',
'3133 E Main St, Mohegan Lake NY 10547',
'288 Larkin, Monroe NY 10950',
'41 Anawana Lake Road, Monticello NY 12701',
'4765 Commercial Drive, New Hartford NY 13413',
'1201 Rt 300, Newburgh NY 12550',
'255 W Main St, Avon CT 6001',
'120 Commercial Parkway, Branford CT 6405',
'1400 Farmington Ave, Bristol CT 6010',
'161 Berlin Road, Cromwell CT 6416',
'67 Newton Rd, Danbury CT 6810',
'656 New Haven Ave, Derby CT 6418',
'69 Prospect Hill Road, East Windsor CT 6088',
'150 Gold Star Hwy, Groton CT 6340',
'900 Boston Post Road, Guilford CT 6437',
'2300 Dixwell Ave, Hamden CT 6514',
'495 Flatbush Ave, Hartford CT 6106',
'180 River Rd, Lisbon CT 6351',
'420 Buckland Hills Dr, Manchester CT 6040',
'1365 Boston Post Road, Milford CT 6460',
'1100 New Haven Road, Naugatuck CT 6770',
'315 Foxon Blvd, New Haven CT 6513',
'164 Danbury Rd, New Milford CT 6776',
'3164 Berlin Turnpike, Newington CT 6111',
'474 Boston Post Road, North Windham CT 6256',
'650 Main Ave, Norwalk CT 6851',
'680 Connecticut Avenue, Norwalk CT 6854',
'220 Salem Turnpike, Norwich CT 6360',
'655 Boston Post Rd, Old Saybrook CT 6475',
'625 School Street, Putnam CT 6260',
'80 Town Line Rd, Rocky Hill CT 6067',
'465 Bridgeport Avenue, Shelton CT 6484',
'235 Queen St, Southington CT 6489',
'150 Barnum Avenue Cutoff, Stratford CT 6614',
'970 Torringford Street, Torrington CT 6790'
]

Review.destroy_all
Booking.destroy_all
Idea.destroy_all
User.destroy_all

p "create users"
user = User.create!(
  email: 'genius@seed.io',
  first_name: 'Jean-Ol',
  last_name: 'Grogo',
  admin: false,
  # password: Faker::Internet.password(10, 20)
  password: "kalgrogo"
)
user.remote_photo_url = 'https://picsum.photos/200/200/?random'
user.save!
user = User.create!(
  email: 'dummy@seed.io',
  first_name: 'elon',
  last_name: 'musk',
  admin: false,
  # password: Faker::Internet.password(10, 20)
  password: "kalgrogo"
)
user.remote_photo_url = 'https://picsum.photos/200/200/?random'
user.save!

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create!(
    email: Faker::Internet.email("#{first_name} #{last_name}", '_'),
    first_name: first_name,
    last_name: last_name,
    admin: false,
    # password: Faker::Internet.password(10, 20)
    password: "kalgrogo"
  )
  user.remote_photo_url = 'https://picsum.photos/200/200/?random'
  user.save!
end




admin = User.create!(
  email: 'master@seed.io',
  first_name: 'Master',
  last_name: 'Seed',
  admin: true,
  # password: Faker::Internet.password(10, 20)
  password: "kalgrogo"
)
admin.remote_photo_url = 'https://picsum.photos/200/200/?random'
admin.save!

puts "Create Ideas"




ad_idea = Idea.create!(
  user_id: User.last.id,
  title: "Meet Love",
  description: "A revolutionary idea for woldwide Drunk lovers. Learn the pedigree of a random Drunk with AlloDrunk. He barks, and we make the wold's best IA run to retrieve his pedigree. First tests are enthoutiastic. YC has already given 10B$. What's next ?",
  category: "DATING APP",
  revenue_model: "Subscription",
  pricing: rand(50..200),
  start_date: Faker::Date.forward(1),
  end_date: Faker::Date.forward(100 + rand(1..100)),
  minimum_duration: rand(1..3),
  application_criteria: "any",
  address: ADDRESSES.shuffle.first,
  is_ad: true
)

url = "app/assets/images/tinder.png"
ad_idea.remote_photo_url = url
ad_idea.save

ad_idea = Idea.create!(
  user_id: User.last.id,
  title: "Spotify premium",
  description: "A revolutionary idea for woldwide Drunk lovers. Learn the pedigree of a random Drunk with AlloDrunk. He barks, and we make the wold's best IA run to retrieve his pedigree. First tests are enthoutiastic. YC has already given 10B$. What's next ?",
  category: "MUSIC",
  revenue_model: "Subscription",
  pricing: rand(50..200),
  start_date: Faker::Date.forward(1),
  end_date: Faker::Date.forward(100 + rand(1..100)),
  minimum_duration: rand(1..3),
  application_criteria: "any",
  address: ADDRESSES.shuffle.first,
  is_ad: true
)

url = "app/assets/images/spotify.png"
ad_idea.remote_photo_url = url

ad_idea.save
ad_idea = Idea.create!(
  user_id: User.last.id,
  title: "McDonald's",
  description: "A revolutionary idea for woldwide Drunk lovers. Learn the pedigree of a random Drunk with AlloDrunk. He barks, and we make the wold's best IA run to retrieve his pedigree. First tests are enthoutiastic. YC has already given 10B$. What's next ?",
  category: "Gastronomy",
  revenue_model: "Subscription",
  pricing: rand(50..200),
  start_date: Faker::Date.forward(1),
  end_date: Faker::Date.forward(100 + rand(1..100)),
  minimum_duration: rand(1..3),
  application_criteria: "any",
  address: ADDRESSES.shuffle.first,
  is_ad: true
)

url = "app/assets/images/mcdo.png"
ad_idea.remote_photo_url = url
ad_idea.save


first_idea = Idea.create!(
  user_id: User.first.id,
  title: "AlloChien",
  description: "A revolutionary idea for woldwide dog lovers. Learn the pedigree of a random dog with allochien. He barks, and we make the wold's best IA run to retrieve his pedigree. First tests are enthoutiastic. YC has already given 10B$. What's next ?",
  category: "Pets and animals",
  revenue_model: "Subscription",
  pricing: rand(50..200),
  start_date: Faker::Date.forward(1),
  end_date: Faker::Date.forward(100 + rand(1..100)),
  minimum_duration: rand(1..3),
  application_criteria: "any",
  address: ADDRESSES.shuffle.first
)

url = "https://images.unsplash.com/photo-1505628346881-b72b27e84530?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8ecbdf99ad1c8e52f00c7f6682a27f27&auto=format&fit=crop&w=934&q=80"
first_idea.remote_photo_url = url
first_idea.save

first_idea = Idea.create!(
  user_id: User.first.id,
  title: "AlloPoney",
  description: "A revolutionary idea for woldwide poney lovers. Learn the pedigree of a random Poney with allochien. He barks, and we make the wold's best IA run to retrieve his pedigree. First tests are enthoutiastic. YC has already given 10B$. What's next ?",
  category: "Pets and animals",
  revenue_model: "Subscription",
  pricing: rand(50..200),
  start_date: Faker::Date.forward(1),
  end_date: Faker::Date.forward(100 + rand(1..100)),
  minimum_duration: rand(1..3),
  application_criteria: "any",
  address: ADDRESSES.shuffle.first
)

url = "https://images.unsplash.com/photo-1505628346881-b72b27e84530?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8ecbdf99ad1c8e52f00c7f6682a27f27&auto=format&fit=crop&w=934&q=80"
first_idea.remote_photo_url = url
first_idea.save

first_idea = Idea.create!(
  user_id: User.first.id,
  title: "AlloDrunk",
  description: "A revolutionary idea for woldwide Drunk lovers. Learn the pedigree of a random Drunk with AlloDrunk. He barks, and we make the wold's best IA run to retrieve his pedigree. First tests are enthoutiastic. YC has already given 10B$. What's next ?",
  category: "Pets and animals",
  revenue_model: "Subscription",
  pricing: rand(50..200),
  start_date: Faker::Date.forward(1),
  end_date: Faker::Date.forward(100 + rand(1..100)),
  minimum_duration: rand(1..3),
  application_criteria: "any",
  address: ADDRESSES.shuffle.first
)

url = "https://images.unsplash.com/photo-1505628346881-b72b27e84530?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8ecbdf99ad1c8e52f00c7f6682a27f27&auto=format&fit=crop&w=934&q=80"
first_idea.remote_photo_url = url
first_idea.save


second_idea = Idea.create!(
  user_id: User.second.id,
  title: "Lobster Farm in France",
  description: "Everyone loves lobsters and they are so expansive. There are no farms...yet. I have been engineering a farm protocol which is working perfectly fine",
  category: "Food retail and service",
  revenue_model: "Selling lobsters",
  pricing: rand(50..200),
  start_date: Faker::Date.forward(1),
  end_date: Faker::Date.forward(100 + rand(1..100)),
  minimum_duration: rand(1..3),
  application_criteria: "any",
  address: ADDRESSES.shuffle.first
)

url = "https://images.unsplash.com/photo-1533637224197-c90880aa997c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3a7daa8b052b8610bc402cc80f39facc&auto=format&fit=crop&w=976&q=80"
second_idea.remote_photo_url = url
second_idea.save

User.all.each do |user|
  10.times do
    idea = Idea.create!(
      user_id: user.id,
      # user_id: User.order("RANDOM()").first.id,
      title: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph_by_chars(rand(100..500), false),
      category: CATEGORIES.shuffle.first,
      revenue_model: "",
      pricing: rand(50..200),
      start_date: Faker::Date.forward(1),
      end_date: Faker::Date.forward(100 + rand(1..100)),
      minimum_duration: rand(1..3),
      application_criteria: "any",
      address: ADDRESSES.shuffle.first
    )
    idea.remote_photo_url = 'https://picsum.photos/300/400/?random'
    idea.save
  end
end


p "create bookings"
bookings_array = []

200.times do
  available_idea = false
  unless available_idea
    idea = Idea.order("RANDOM()").first
    available_idea = true if !bookings_array.include?(idea)
  end
  user_is_creator = true
  while user_is_creator
    attempt = User.order("RANDOM()").first
    if attempt.id != idea.user_id
      user_is_creator = false
      user_id = attempt.id
    end
  end

  my_hash = {
    idea_id: idea.id,
    user_id: user_id,
    start_date: idea.start_date,
    end_date: idea.end_date,
    request_message: Faker::Lorem.paragraph_by_chars(rand(100..500), false)
  }
  bookings_array << my_hash
end

Booking.create!(bookings_array)

p "create reviews"
reviews_array = []
Booking.all.each do |booking|
  my_hash = {
    booking_id: booking.id,
    rating: rand(1..5),
    comment: Faker::Lorem.paragraph_by_chars(rand(100..500), false)
  }
  reviews_array << my_hash
end

Review.create!(reviews_array)


