class Plane

	def initialize
		@image = Gosu::Image.new('plane.png')
		@height = @image.height
		@width = @image.width
		@x = 800/2 - @image.width/2
		@y = 500
	end

	def update
		move_with_input
	end

	def draw
		@image.draw(@x, @y, 1)
	end

	def move_with_input
		if Gosu::button_down?(Gosu::KbLeft)
			@x -= 4
		end

		if Gosu::button_down?(Gosu::KbRight)
			@x += 4
		end
	end

    def center_x
        center_x = @x + @width/2
        return center_x
    end

end
