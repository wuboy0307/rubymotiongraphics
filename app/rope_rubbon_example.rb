
class RopeRubbonExample < NSView

  def drawRect(rect)
    dimensions = [CGRectGetWidth(rect), CGRectGetHeight(rect)]
    RMGraphics::Canvas.for_current_context(:size => dimensions) do |canvas|
      # choose a random color and set the background to a darker variant
      clr = RMGraphics::Color.random.a(0.5)
      canvas.background(clr.copy.darken(0.6))

      # create a new rope with 200 fibers
      rope = RMGraphics::Rope.new(canvas, :width => 500, :fibers => 200, :stroke_width => 1.0, :roundness => 1.5)

      # randomly rotate the canvas from its center
      canvas.translate(canvas.width/2, canvas.height/2)
      canvas.rotate(RMGraphics.random(0, 360))
      canvas.translate(-canvas.width/2, -canvas.height/2)

      # draw 20 ropes
      ropes = 20
      ropes.times do |i|
         canvas.stroke(clr.copy.analog(10, 0.7)) # rotate hue up to 10 deg left/right, vary brightness/saturation by up to 70%
         rope.x0 = -100 # start rope off bottom left of canvas
         rope.y0 = -100
         rope.x1 = canvas.width + 200 # end rope off top right of canvas
         rope.y1 = canvas.height + 200
         rope.ribbon # draw rope
      end
    end
  end

end
