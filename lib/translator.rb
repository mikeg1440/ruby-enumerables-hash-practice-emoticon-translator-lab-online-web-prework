require "yaml"

def load_library(file)              # takes a yaml files path as arguments and returns a hash of the values
  file_hash = YAML.load_file(file)
  new_hash = {
    :get_meaning => {},
    :get_emoticon => {}
  }

  file_hash.each do |meaning, emoticons|
    # puts "Key: #{key}\nArray: #{array}"
    
    new_hash[:get_emoticon][emoticons[0]] = emoticons[1]
    new_hash[:get_meaning][emoticons[1]] = meaning
  end
  new_hash
end



def get_japanese_emoticon(file, eng_emoticon)             # takes a yaml file's path and english emoticon as a arguments and returns the japanese emoticons 
  emoticons = load_library(file)
  emoticons = emoticons[:get_emoticon]
  
  
  japanese_emoticon = emoticons[eng_emoticon]

  if !japanese_emoticon
    return "Sorry, that emoticon was not found"
  end

  japanese_emoticon
end

def get_english_meaning(file, jap_emoticon)                 # takes a yaml file's path and japanese emoticon as arguemtns and returns the meaning
  emoticons = load_library(file)
  emoticons = emoticons[:get_meaning]
  english_translation = ""
  
  emoticons.each do |emoticon, meaning|
    
    #puts "Key: #{emoticon}\nArray: #{meaning}"
    
    if emoticon == jap_emoticon
      english_translation = meaning
    end

  end
  
  if english_translation == "" 
    return "Sorry, that emoticon was not found"
  end
  
  english_translation
end

