class BoundingBox

def initialize(x,y,w,h)
  @x=x
  @y=y
  @w=w
  @h=h
end


def width
  @w
end

def height
  @h
end

def left
  @x
end

def right
  @x+@w
end

def top
  @y+@h
end

def bottom
  @y
end

def contains_point?(x,y)
  if x>=left && x<=right && y>=bottom && y<=top
    true
  else
    false
  end
end

end
