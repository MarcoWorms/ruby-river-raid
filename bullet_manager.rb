class Bullet_manager

	def initialize
		@bullets = []
		@bullet_image = Gosu::Image.new('bullet.png')
	end

	def update
		for bullet in @bullets
			bullet.y -= 4
            check_out_of_bounds_and_kill(bullet)
		end
	end

	def draw
		for bullet in @bullets
            bullet.draw
		end
	end

    def spawn(plane_center_x)
        bullet_center_x = @bullet_image.width/2
        spawn_x = plane_center_x - bullet_center_x
        @bullets.push(Bullet.new(spawn_x, @bullet_image))
    end

    def check_out_of_bounds_and_kill(bullet)
        bullet_height = @bullet_image.height
        if bullet.y <= -bullet_height
            @bullets -= [bullet]
        end
    end

end

class Bullet

    attr_accessor :y

    def initialize(spawn_x, image)
        @y = 500
        @x = spawn_x
        @image = image
    end

    def draw
        @image.draw(@x, @y, 2)
    end
end