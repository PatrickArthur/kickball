
require_relative 'bounding_box'


class BoundingArea

  def initialize(bounding_boxes)
    @bounding_boxes=bounding_boxes
  end


  def contains_point?(x,y)
    @bounding_boxes.each do |bounding_box|
      if bounding_box.contains_point?(x,y)
        return true
      end
    end
    false
  end
end
