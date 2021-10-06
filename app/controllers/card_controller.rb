class CardController < ApplicationController
 def index
 	@card = Card.all
  end
end
