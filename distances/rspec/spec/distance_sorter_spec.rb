require 'rspec'
require 'json'
require_relative './../../distance_sorter.rb'

describe DistanceSorter do
  subject(:distance_sorter) { DistanceSorter.new}

  describe "#initialize" do
    it "sets @customers to empty hash" do
      expect(distance_sorter.customers).to eq({})
    end
    it "sets @closest_customers to empty array" do
      expect(distance_sorter.closest_customers).to eq([])
    end
  end

  describe "#who_to_invite" do
    it "calls #de_json_ify" do
      distance_sorter.stub(:de_json_ify)
      distance_sorter.who_to_invite
      expect(distance_sorter).to have_received(:de_json_ify)
    end

    it "calls #get_closest_customers" do
      distance_sorter.stub(:get_closest_customers)
      distance_sorter.who_to_invite
      expect(distance_sorter).to have_received(:get_closest_customers)
    end

    it "calls #render_data" do
      distance_sorter.stub(:render_data)
      distance_sorter.who_to_invite
      expect(distance_sorter).to have_received(:render_data)
    end
  end
end
