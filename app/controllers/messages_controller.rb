class MessagesController < ApplicationController
  def index
    @rooms = []
    10.times do |i|
      @rooms << "chatroom" + (i+1).to_s
    end
  end
end
