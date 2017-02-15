module GreatCircleDistance
  def self.to_radius(degrees)
    return degrees * (Math::PI / 180.0)
  end

  def self.to_km(radians)
    return radians * 6371.00
  end

  def self.distance_to_dublin(lat_a, lng_a)
    lat_d = 53.338198
    lng_d = -6.2592576
    lat = to_radius(lat_a - lat_d);
    lng = to_radius(lng_a - lng_d);

    angle = Math.sin(lat/2)**2 + Math.cos(self.to_radius(lat_a)) * Math.cos(self.to_radius(lat_d)) * Math.sin(lng/2) ** 2
    distance = 2 * Math.atan2(Math.sqrt(angle), Math.sqrt(1 - angle))
    return self.to_km(distance)
  end

  def self.get_distances(customers)
    customers.each do |user_id, customer|
      lat = customer["latitude"].to_f
      lng = customer["longitude"].to_f
      distance = self.distance_to_dublin(lat, lng)
      customer["distance"] += distance
    end
    return customers
  end
end
