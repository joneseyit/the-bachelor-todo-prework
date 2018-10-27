require "pry"
hash = {
  "season 30": [
    {
      "name":      "Beth Smalls",
      "age":       "26",
      "hometown":  "Great Falls, Virginia",
      "occupation":"Nanny/Freelance Journalist",
      "status":    "Winner"
    },
    {
      "name":       "Becca Tilley",
      "age":        "27",
      "hometown":   "Shreveport, Louisiana",
      "occupation": "Chiropractic Assistant",
      "status":     "Eliminated Week 8"
    }
  ],
  "season 29": [
    {
      "name":      "Ashley Yeats",
      "age":       "24",
      "hometown":  "Denver, Colorado",
      "occupation":"Dental Assitant",
      "status":    "Winner"
    },
    {
      "name":       "Sam Grover",
      "age":        "29",
      "hometown":   "New York, New York",
      "occupation": "Entertainer",
      "status":     "Eliminated Week 6"
    }
  ]
}









def get_first_name_of_season_winner(data, season)
  winner_name = ""
  data[season].each do |contestant_info|
    if contestant_info.has_value?("Winner")
      winner_name = contestant_info["name"]
    end
  end
  winner_name.split[0]
end

def get_contestant_name(data, occupation)
  name = ""
  data.each do |season, contestant_array|
    contestant_array.each do |contestant|
      if contestant.has_value?(occupation)
        name = contestant["name"]
      end
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season, contestant_array|
    contestant_array.each do |contestant|
      if contestant.has_value?(hometown)
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  data.each do |season, contestant_array|
    contestant_array.each do |contestant|
      if contestant.has_value?(hometown)
        return contestant["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  total_age = 0
  total_num_of_contestants = 0

  data[season].each do |contestant_hash|
      total_age += contestant_hash["age"].to_f
      total_num_of_contestants += 1
  end
  avg_age = (total_age / total_num_of_contestants).round
end
