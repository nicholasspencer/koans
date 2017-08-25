#!/usr/bin/env ruby

class Shop

  attr_accessor :wares
  attr_accessor :graph

  def initialize(wares = [])
    @wares = wares
  end

  def connect_roads
    graph.roads.select { |road| road.source == self }
  end

  def connect_shops
    connect_roads.map do |roads|
      graph.shops.select { roads.destination
    end
  end

end

class Road

  attr_accessor source, destination, length

  def initalize (source, destination, length)
    @source = source
    @destination = destination
    @length = length
  end

  def <=>(road)
    self.length <=> road.length
  end

end

class City

  attr_accessor :shops, :roads

  def initialize
    @shops = []
    @roads = []
  end

  def addShopAsString(string)
    addShopWithWares string.split(" ")[1 .. -1].map(&:to_i)
  end

  def addShopWithWares(wares)
    addShop(Shop.new(wares))
  end

  def addShop(shop)
    @shops.push shop
    shop.graph = self
  end

  def addRoadAsString(string)
    addRoad(string.split(" ").map(&:to_i))
  end

  def addRoad(source, destination, length)
    @roads.push Road.new(source, destination, length)
    #allow the graph to traverse backwards
    @roads.push Road.new(destination, source, length)
  end

  #####

  class 
  def solve



  end

end


input = File.open("synchronous.shopping.input").readlines





# Counts = Struct.new(:shops, :roads, :fish)
# counts = Counts.new(*input[0].split(" ").map(&:to_i))

# # vertex
# Shop = Struct.new(:fish, :id)
# shops = input[1 .. counts[:shops]].each_with_index.map do |shop, index|
#   shop = Shop.new(shop.split(" ")[1 .. -1].map(&:to_i), index+1)
#   shop.fish = shop.fish.reduce(:|)
#   shop
# end

# #edge
# Road = Struct.new(:a, :b, :length)
# roads = input[counts[:shops]+1 .. -1].map do |road|
#   road = road.split(" ").map(&:to_i)
#   ab = Road.new(*road)
#   road[0], road[1] = road[1], road[0]
#   ba = Road.new(*road)
#   [ab, ba]
# end
# roads.flatten!

# def neighbors(shop, roads, queue)
#   road = roads.select do |road| 
#     road.a == shop.id && queue.one? { |shop| road.b == shop.id }
#   end
# end

# def dijkstra(roads, shops, starting_shop)
#   distance = {}
#   previous = {}
#   queue = shops.clone

#   queue.each do |shop| 
#     distance[shop] = Float::INFINITY
#   end

#   distance[starting_shop] = 0

#   # until queue.empty?
#     closestShop = nil
#     distance.each do |shop, shop_distance|
#       if closestPath > shop_distance then
#         closestPath = shop_distance
#         closestShop = shop
#       end
#     end
#     queue.delete(closestShop)

#     neighbors = neighbors(closestShop, roads, queue)
#     neighbors.each do |shop|
#       alt = distance[closestShop] + vertices.length_between(closestShop, vertex)
#       if alt < distance[shop]
#         distance[shop] = alt
#         previouses[vertices] = closestShop
#       end
#     end
#   # end

# end

# dijkstra(roads, shops, shops.first)
