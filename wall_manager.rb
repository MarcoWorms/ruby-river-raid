class Wall_manager

    attr_reader :walls

    def initialize
        @walls = []
        bottom_variation = rand(401) - 200
        top_variation = rand(401) - 200
        @walls.push(Wall.new(-300, 600, top_variation, bottom_variation))
        @wall_spawn_timer = Timer.new(2)
    end

    def update
        if @wall_spawn_timer.tick
            top_variation = rand(401) - 200
            @walls.push(Wall.new(-300, @walls.last.top_y, top_variation, @walls.last.top_variation))
        end

        for wall in @walls
            wall.update
            check_out_of_bounds_and_kill(wall)
        end

    end

    def draw
        for wall in walls
            wall.draw
        end
    end

    def check_out_of_bounds_and_kill(wall)
        wall_offscreen_limit = 600
        wall_offscreen = (wall.top_y > wall_offscreen_limit)
        if wall_offscreen
            remove_wall(wall)
        end
    end

    def remove_wall(wall)
        @walls -= [wall]
    end

end

class Wall

    attr_reader :top_y, :bottom_y, :top_variation, :left_block, :right_block

    def initialize(top_y, bottom_y, top_variation, bottom_variation)
        screen_size = 800
        @top_variation = top_variation
        @top_y = top_y
        @bottom_y = bottom_y
        @top_border_size = (screen_size - (600 + top_variation))/2
        @bottom_border_size = (screen_size - (600 + bottom_variation))/2

        update_blocks
    end

    def update
        @top_y += 2
        @bottom_y += 2
        update_blocks
    end

    def draw()
        draw_block(@left_block)
        draw_block(@right_block)
    end

    def update_blocks

        @left_block = {
            "A" => [0, @top_y],
            "B" => [@top_border_size, @top_y],
            "C" => [0, @bottom_y],
            "D" => [@bottom_border_size, @bottom_y]
        }

        @right_block = {
            "A" => [800 - @top_border_size, @top_y],
            "B" => [800, @top_y],
            "C" => [800 - @bottom_border_size, @bottom_y],
            "D" => [800, @bottom_y]
        }
    end

    def draw_block(block)
        Gosu::draw_quad(
            block["A"][0], block["A"][1], Gosu::Color.argb(0xff_00ff00),
            block["B"][0], block["B"][1], Gosu::Color.argb(0xff_00ff00),
            block["C"][0], block["C"][1], Gosu::Color.argb(0xff_00ff00),
            block["D"][0], block["D"][1], Gosu::Color.argb(0xff_00ff00),
            5)
    end

    def limit_left(on_y)
        b = [left_block["B"][0], left_block["B"][1]]
        d = [left_block["D"][0], left_block["D"][1]]

    end

end