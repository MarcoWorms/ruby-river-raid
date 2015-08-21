class Enemy_manager

    def initialize(spawn_interval)
        @enemy_image = Gosu::Image.new('enemy.png')
        @enemies = []
        @enemy_spawn_timer = Timer.new(1)
    end

    def update
        if @enemy_spawn_timer.tick
            spawn_enemy(300)
        end

        for enemy in @enemies
            enemy.move
        end
    end

    def draw
        for enemy in @enemies
            enemy.draw
        end
    end

    def spawn_enemy(spawn_x)
        @enemies.push(Enemy.new(@enemy_image, spawn_x))
    end


end



class Enemy

    def initialize(image, spawn_x)
        @image = image
        @height = @image.height
        @width = @image.width
        @x = spawn_x
        @y = 0 - @height
    end

    def draw
        @image.draw(@x, @y, 3)
    end

    def move
        @y += 3
    end

end
