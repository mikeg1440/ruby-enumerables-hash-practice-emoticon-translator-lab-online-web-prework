require "yaml"

def load_library(file)
  file_hash = YAML.load_file(file)
  new_hash = {
    :get_meaning => {},
    :get_emoticon => {}
  }
  
  
  
  file_hash.each do |key, array|
    # puts "Key: #{key}\nArray: #{array}"
    
    new_hash[:get_emoticon][array[0]] = array[1]
    new_hash[:get_meaning][array[1]] = key
  end
  new_hash
end



def get_japanese_emoticon(eng_emoticon)
  emoticons = load_library("lib/emoticons.yml")
  emoticons = emoticons[:get_emoticon]
  emoticons_key = ""

  emoticons.each do |jap_emoticon, emoticon|
    
    #puts "K: #{jap_emoticon}\nA: #{emoticon}"
  
    puts emoticons.key(eng_emoticon)
    
    
    #array.select do |elem| 
      # if elem == eng_emoticon
      #   emoticons_key = key
      # end
      
    #end

  end
  
  if emoticons_key == ""
    return "Sorry, that emoticon was not found"
  end
  
  emoticons[emoticons_key][1]
end

def get_english_meaning(jap_emoticon)
  emoticons = load_library("lib/emoticons.yml")
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

#get_english_meaning("%)")
get_japanese_emoticon("%)")
# load_library("lib/emoticons.yml")
