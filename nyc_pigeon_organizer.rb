require "pry"

data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}


def get_names(data)
  ary = []
  data[:color].each { |key, value| ary << value }
  ary.flatten!.uniq!
  ary
end

def get_tag_data(data, new_hash, tag)
  data[tag].each do |key, names|
    new_hash.each do |name, d|
      if data[tag][key].include?(name)
        new_hash[name][tag] << key
      end
    end
  end
new_hash
end

def nyc_pigeon_organizer(data)
  new_hash = {}
  names = get_names(data)
  names.each do |name|
    new_hash[name] = {color: [], gender: [], lives: []}
  end
  new_hash = get_tag_data(data, new_hash, :color)
  new_hash = get_tag_data(data, new_hash, :gender)
  new_hash = get_tag_data(data, new_hash, :lives)
binding.pry

end

#nyc_pigeon_organizer(data)
