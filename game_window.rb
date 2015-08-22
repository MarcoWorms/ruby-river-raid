class Game_window < Gosu::Window

	def initialize
		super(800,600)
		@plane = Plane.new
		@bullet_manager = Bullet_manager.new
        @enemy_manager = Enemy_manager.new(1)
	end

	def update
		@plane.update
        @enemy_manager.update
        @bullet_manager.update(@enemy_manager)
	end

	def draw
		@plane.draw
		@bullet_manager.draw
        @enemy_manager.draw
	end

	def button_down(keydown_id)
		resolve_input(keydown_id)
	end

    def needs_cursor?
        return true
    end

    def resolve_input(keydown_id)
        case keydown_id
        when Gosu::KbSpace
            @bullet_manager.spawn(@plane.center_x)
        end
    end

end
