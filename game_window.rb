class Game_window < Gosu::Window

	def initialize
		super(800,600)
		@plane = Plane.new
		@bullet_manager = Bullet_manager.new
        @enemy_manager = Enemy_manager.new(1)
	end

	def update
		@plane.update
		@bullet_manager.update
        @enemy_manager.update
	end

	def draw
		@plane.draw
		@bullet_manager.draw
        @enemy_manager.draw
	end

	def button_down(id)
		case id
		when Gosu::KbSpace
			@bullet_manager.spawn(@plane.center_x)
		end
	end

end
