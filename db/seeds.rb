amenities = [["Television", "Entertainment", '<i class="fa-solid fa-tv"></i>'],
             ["Music player", "Entertainment", '<i class="fa-solid fa-music"></i>'],
             ["Swimming pool", "Sports and activities", '<i class="fa-solid fa-water-ladder"></i>'],
             ["Gym", "Sports and activities", '<i class="fa-solid fa-dumbbell"></i>'],
             ["Wifi", "Internet and office", '<i class="fa-solid fa-wifi"></i>'],
             ["Air conditioning", "Heating and cooling", '<i class="fa-regular fa-snowflake"></i>'],
             ["Fire place", "Heating and cooling", '<i class="fa-solid fa-fire"></i>'],
             ["Rain shower", "Bathroom", '<i class="fa-solid fa-shower"></i>'],
             ["Soap", "Bathroom", '<i class="fa-solid fa-soap"></i>'],
             ["Utensils", "Kitchen", '<i class="fa-solid fa-utensils"></i>'],
             ["Coffee machine", "Kitchen" , '<i class="fa-solid fa-mug-hot"></i>']
            ]

amenities.each do |amenity|
  Amenity.create(name: amenity[0], category: amenity[1], icon: amenity[2])
end
