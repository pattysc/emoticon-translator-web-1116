require "yaml"

def load_library(filepath)
  emoticonshash = YAML.load_file(filepath)
  japanese_ems = {}
  english_ems = {}
  emoticonshash.each do |name, ems|
    japanese_ems[ems[1]] = name;
    english_ems[ems[0]] = ems[1];
  end

  getem_getmean = {"get_emoticon" => english_ems, "get_meaning" => japanese_ems}
  return getem_getmean
end

def get_japanese_emoticon(filepath, emoticon)
  getem_getmean = load_library(filepath)


  return getem_getmean["get_emoticon"][emoticon] || "Sorry, that emoticon was not found"

end

def get_english_meaning(filepath, emoticon)
  getem_getmean = load_library(filepath)

  return getem_getmean["get_meaning"][emoticon] || "Sorry, that emoticon was not found"
end
