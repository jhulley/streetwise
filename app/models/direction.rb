class Direction
  def initialize(args)
    @origin_address = args["origin"]
    @destination_address = args["destination"]
    geocode_endpoints
  end

  def origin_node
    @origin_node
  end

  def destination_node
    @destination_node
  end

  def gen_paths
    @paths = Graph.get_paths(@origin_node, @destination_node)
    { paths: @paths, origin: @origin_address, destination: @destination_address, origin_coords: @origin_coords, destination_coords: @destination_coords }
  end

  private
  def geocode_endpoints
    if @origin_address && @destination_address
      @origin_coords = point_geocode(@origin_address)
      @destination_coords = point_geocode(@destination_address)
    end

    @origin_node = Node.closest_node( {coords: @origin_coords} )
    @destination_node = Node.closest_node( {coords: @destination_coords} )
  end

  def point_geocode(address)
    coords = Geocoder.coordinates(address)
    { "lat" => coords[0], "lon" => coords[1] }
  end
end