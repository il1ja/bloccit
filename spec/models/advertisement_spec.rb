require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) { Advertisement.create!(title: "New Advertisement Title", cpoy: "New Ad Copy", price: "10") }

  describe "attributes" do
  # it "has a copy attribute" do
  #   expect(advertisement).to have_attributes(copy: "New Ad Copy")
  # end
  # it "has a title attribute" do
  #   expect(advertisement).to have_attributes(title: "New Advertisement Title")
  # end
  # it "has a price attribute" do
  #   expect(advertisement).to have_attributes(price: "10")
  # end
    it "has title body and resolved attributes" do
      expect(advertisement).to have_attributes(title: "New Advertisement Title", cpoy: "New Ad Copy", price: "10")
    end
  end

end
