class Game_window < Gosu::Window

	def initialize
		super(800,600)
		@plane = Plane.new
		@bullet_manager = Bullet_manager.new
        @enemy_manager = Enemy_manager.new(1)
        @wall_manager = Wall_manager.new
        @bg = {"color" => Gosu::Color.argb(0xff_0000ff)}
	end

	def update
        @wall_manager.update
		@plane.update(@wall_manager)
        @enemy_manager.update(@wall_manager)
        @bullet_manager.update(@enemy_manager, @wall_manager)

	end

	def draw
        Gosu::draw_rect(0,0,800, 600, @bg["color"], 0)
		@plane.draw
		@bullet_manager.draw
        @enemy_manager.draw
        @wall_manager.draw
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
