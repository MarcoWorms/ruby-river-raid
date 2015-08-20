class Bullet_manager

	def initialize
		@bullets = []
		@bullet_image = Gosu::Image.new('bullet.png')
	end

	def update
		for bullet in @bullets
			bullet.y += 4
		end
	end

	def draw
		for bullet in @bullets
			
		end
	end

end