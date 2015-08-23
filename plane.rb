class Plane

	def initialize()
		@image = Gosu::Image.new('plane.png')
		@height = @image.height
		@width = @image.width
		@x = 800/2 - @image.width/2
		@y = 500
        @x_collision_offset = 10
	end

	def update(wall_manager)
		move_with_input(wall_manager)
        detect_collision(wall_manager)
	end

	def draw
		@image.draw(@x, @y, 1)
	end

	def move_with_input(wall_manager)
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

    def detect_collision(wall_manager)
        x1 = @x + @x_collision_offset
        x2 = @x + @width - @x_collision_offset
        y = @y
        if wall_manager.object_is_offtrack?(x1, x2, y)
            exit
        end
    end

end
