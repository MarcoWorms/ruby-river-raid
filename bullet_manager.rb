class Bullet_manager

	def initialize
		@bullets = []
		@bullet_image = Gosu::Image.new('bullet.png')
	end

	def update
		for bullet in @bullets
			bullet["y"] -= 4
            if bullet["y"] <= -12
                @bullets -= [bullet]
            end
		end
	end

	def draw
		for bullet in @bullets
			@bullet_image.draw(bullet["x"], bullet["y"], 2)
		end
	end

    def spawn(x)
        @bullets.push({"x" => x - 3, "y" => 500})
    end

end