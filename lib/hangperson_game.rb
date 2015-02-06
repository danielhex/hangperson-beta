class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service
  def initialize(word)
  	@word = word
  	@guess = ''
  	@wrong_guess = ''
  end

  attr_accessor :word, :guess, :wrong_guess
  attr_reader :word, :guess, :wrong_guess 


  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
