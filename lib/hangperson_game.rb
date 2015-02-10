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
  	end
  	compare = chara.downcase
  	wordlow = @word.downcase
  	if chara =~ /[[:alpha:]]/ 
	  	if wordlow.include? compare
	  		if !@guesses.include? chara
	  			@guesses << chara
	  		else
	  			return false
	  		end
	  	else
	  		if @wrong_guesses.include? chara
	  			return false
	  		else
	  			@wrong_guesses << chara
	  		end
	  	end
	  	return true
	  end
	  raise ArgumentError
  end

  def word_with_guesses
  	display = ''
  	@word.each_char do |i|
  		if @guesses.include? i
  			display << i
  		else
  			display << '-'
  		end
  	end
  	return display
  end

  def check_win_or_lose
  	if @wrong_guesses.length >= 7
  		return :lose
  	elsif word_with_guesses == @word
  		return :win
  	else
  		return :play
  	end
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
