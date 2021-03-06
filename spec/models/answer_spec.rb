require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.create!(title: "New Question Title", body: "New Question Body") }
  let(:answer) { Answer.create!(body: 'answer Body', question: question) }

  describe "attributes" do
    it "has a body attribute" do
      expect(answer).to have_attributes(body: "answer Body")
    end
  end
end
