require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "Valid Message" do
    before(:all) do
      @message = Message.new(text: "Hello Test")
    end
    it "valid message" do
      expect(@message).to be_valid
    end
  end

  describe "Invalid Message" do
    before(:all) do
      @message = Message.new()
    end
    it "invalid message" do
      expect(@message).to be_invalid
    end
  end
end
