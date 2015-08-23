class Enemy_manager

    attr_reader :enemies

    def initialize(spawn_interval)
        @enemy_image = Gosu::Image.new('enemy.png')
        @enemies = []
        @enemies.push(Enemy.new(@enemy_image, rand(700) + 50))
        @enemy_spawn_timer = Timer.new(3)
    end

    def update(wall_manager)
        if @enemy_spawn_timer.tick
            spawn_enemy(rand(700) + 50)
        end

        for enemy in @enemies
            enemy.update
            check_out_of_bounds_and_kill(enemy, wall_manager)
        end
    end

    def draw
        for enemy in @enemies
            enemy.draw
        end
    end

    def check_out_of_bounds_and_kill(enemy, wall_manager)
        enemy_vertical_offscreen_limit = 800
        enemy_vertical_offscreen = (enemy.y >= enemy_vertical_offscreen_limit)
        if enemy_vertical_offscreen
            remove_enemy(enemy)
        end

        enemy_is_offtrack = wall_manager.object_is_offtrack?(enemy.x, enemy.x + enemy.width, enemy.y + enemy.height/2)

        if enemy_is_offtrack
            remove_enemy(enemy)
            spawn_enemy(rand(800))
        end
    end

    def spawn_enemy(spawn_x)
        @enemies.push(Enemy.new(@enemy_image, spawn_x))
    end

    def remove_enemy(enemy)
        @enemies -= [enemy]
    end

end

class Enemy

    attr_reader :x, :y, :width, :height

    def initialize(image, spawn_x)
        @image = image
        @height = @image.height
        @width = @image.width
        @x = spawn_x
        @y = 0 - @height
    end

    def update
        @y += 2
    end

    def draw
        @image.draw(@x, @y, 10)
    end

end
