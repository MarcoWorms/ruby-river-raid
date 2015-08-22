class Plane

	def initialize()
		@image = Gosu::Image.new('plane.png')
		@height = @image.height
		@width = @image.width
		@x = 800/2 - @image.width/2
		@y = 500
	end

	def update(wall_manager)
		move_with_input(wall_manager)
        evaluate_collision(wall_manager)
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

    def evaluate_collision(wall_manager)
        walls = wall_manager.walls
        for wall in walls
            if wall.top_y <= @y && @y <= wall.bottom_y
                #if @x <= limit_left([@y])
                #    @x = wall.limit_left([@y])
                #end
            end
        end
    end

end
