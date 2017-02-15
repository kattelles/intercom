require 'json'
require_relative 'great_circle_distance'

class DistanceSorter
  attr_reader :customers, :closest_customers
  def initialize()
    @file_contents = []
    @customers = {}
    @closest_customers = []
  end

  def get_file_contents(filename)
    @file_contents = File.readlines(filename)
  end

  def de_json_ify
    formatted_contents = {}
    @file_contents.each do |customer|
      customer = JSON.parse(customer)
      customer["distance"] = 0
      formatted_contents[customer["user_id"]] = customer
    end
    @customers = formatted_contents
  end

  def get_closest_customers
    @customers.each do |user_id, customer_data|
      if customer_data["distance"] >= 100
        @closest_customers << user_id
      end
    end
    @closest_customers
  end

  def render_data
    p "Users within 100km of Dublin HQ (by user_id, ascending):"

    @closest_customers.sort.each do |user_id|
      name = @customers[user_id]["name"]
      p "#{user_id}: #{name}"
    end
  end

  def who_to_invite
    self.de_json_ify
    @customers = GreatCircleDistance.get_distances(@customers)
    get_closest_customers
    render_data
  end
end
