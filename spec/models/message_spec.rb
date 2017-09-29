require 'rails_helper'

RSpec.describe Message, type: :model do
  it "should be important message" do
  	message = create(:message, :important)
  	binding.pry
  end
end
