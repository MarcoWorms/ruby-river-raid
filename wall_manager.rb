class Wall_manager

    def initialize


        @walls = []
        @walls.push(Wall.new(800,600,0))
        @walls.push(Wall.new(800,600))
        @wall_spawn_timer = Timer.new(2)
    end

    def update
        if @wall_spawn_timer.tick
            x_variation = (rand(401) - 200).to_i
            @walls.push(Wall.new(800,600 + x_variation))
        end

        for wall in @walls
            wall.update
        end

    end

    def draw
        times = @walls.length-2
        for index in 0..times
            puts index
            wall = @walls[index]
            wall_link = @walls[index + 1]
            wall.draw(wall_link)
        end
    end

end

class Wall

    attr_reader :y, :left_x, :right_x

    def initialize(screen_size, base_size, y = -300)

        inutilized_size = screen_size - base_size
        border_radius = inutilized_size/2
        @left_x = 0 + border_radius
        @right_x = screen_size - border_radius

        @y = y
    end

    def update
        @y += 2
    end

    def draw(link)
        Gosu::draw_quad(
            0, link.y,       Gosu::Color.argb(0xff_ffffff),
            link.left_x, link.y,  Gosu::Color.argb(0xff_ffffff),
            0, @y,           Gosu::Color.argb(0xff_ffffff),
            @left_x, @y,     Gosu::Color.argb(0xff_ffffff),
            5)
        Gosu::draw_quad(
            link.right_x, link.y,  Gosu::Color.argb(0xff_ffffff),
            800, link.y,     Gosu::Color.argb(0xff_ffffff),
            @right_x, @y,    Gosu::Color.argb(0xff_ffffff),
            800, @y,         Gosu::Color.argb(0xff_ffffff),
            5)
    end

end