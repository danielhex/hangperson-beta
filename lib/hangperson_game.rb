class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service
  attr_accessor :word, :guesses, :wrong_guesses

  def initialize(word)
  	@word = word
  	@guesses = ''
  	@wrong_guesses = ''
  end

  def guess(chara)
  	if chara == '' or chara == nil 
  		raise ArgumentError
  	if chara =~ /[[:alpha:]]/ 
	  	if @word.include? chara
	  		if !@guesses.include? chara
	  			@guesses << chara
	  		else
	  			return false
	  		end
	  	else
	  		if !@wrong_guesses.include? chara
	  			@wrong_guesses << chara
	  		else
	  			return false
	  		end
	  	end
	  	return true
	  end
	  raise ArgumentError
  end
  

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
