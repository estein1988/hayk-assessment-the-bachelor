require 'json'
require 'pry'

def get_first_name_of_season_winner(data, season)
  data.each do |term, contestents|
    if term == season
      contestents.each do |info|
        if info["status"] == "Winner"
          return info["name"].split(" ")[0]
        end 
      end 
    end 
  end
end 

def get_contestant_name(data, occupation)
  data.each do |term, contestents|
    contestents.each do |info|
      if info["occupation"] == occupation 
        return info["name"]
      end 
    end 
  end       
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |term, contestents|
    contestents.each do |info|
      if info["hometown"] == hometown  
        counter += 1
      end
    end
  end
  counter 
end 


def get_occupation(data, hometown)
  data.each do |term, contestents|
    contestents.each do |info|
      if info["hometown"] == hometown
        return info["occupation"]
      end 
    end 
  end   
end

def get_average_age_for_season(data, season)
  data.each do |term, contestents|
    if term == season
      ages = contestents.map do |info| 
        info["age"]
      end
      total_ages = ages.reduce(0) do |sum, n|
        sum + n.to_f
      end 
      return (total_ages / ages.length).round()
    end 
  end 
end
