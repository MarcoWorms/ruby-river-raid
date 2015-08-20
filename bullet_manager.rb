class Bullet_manager

	def initialize
		@bullets = []
		@bullet_image = Gosu::Image.new('bullet.png')
	end

	def update
		for bullet in @bullets
			bullet["y"] -= 4
            check_out_of_bounds_and_kill(bullet)
		end
	end

	def draw
		for bullet in @bullets
			@bullet_image.draw(bullet["x"], bullet["y"], 2)
		end
	end

    def spawn(plane_center_x)
        bullet_center_x = @bullet_image.width/2
        spawn_x = plane_center_x - bullet_center_x
        @bullets.push({"x" => spawn_x, "y" => 500})
    end

    def check_out_of_bounds_and_kill(bullet)
        bullet_height = @bullet_image.height
        if bullet["y"] <= -bullet_height
            @bullets -= [bullet]
        end
    end

end