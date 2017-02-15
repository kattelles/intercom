require_relative 'distance_sorter'

distance_sorter = DistanceSorter.new
distance_sorter.get_file_contents("./customers.txt")
distance_sorter.who_to_invite
