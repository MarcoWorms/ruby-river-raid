class Bullet_manager

	def initialize
		@bullets = []
		@bullet_image = Gosu::Image.new('bullet.png')
	end

	def update(enemy_manager)
		for bullet in @bullets
			bullet.update
            check_out_of_bounds_and_kill(bullet)
            check_colision(bullet, enemy_manager)
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
        bullet_offscreen_limit = 0 - bullet.height
        bullet_offscreen = (bullet.y <= bullet_offscreen_limit)
        if bullet_offscreen
            remove_bullet(bullet)
        end
    end

    def remove_bullet(bullet)
        @bullets -= [bullet]
    end

    def check_colision(bullet, enemy_manager)
        for enemy in enemy_manager.enemies
            if bullet.is_overlaping?(enemy)
                remove_bullet(bullet)
                enemy_manager.remove_enemy(enemy)
            end
        end
    end

end

class Bullet

    attr_reader :x, :y, :width, :height

    def initialize(spawn_x, image)
        @y = 500
        @x = spawn_x
        @image = image
        @width = @image.width
        @height = @image.height
    end

    def update
        @y -= 4
    end

    def draw
        @image.draw(@x, @y, 2)
    end

    def is_overlaping?(something)

        # This needs refactoring but it's working exactly as intended.

        self_points = [
                      [@x, @y],
                      [@x + @width, @y],
                      [@x, @y + @height],
                      [@x + @width, @y + @height]
                      ]

        something_final_x = something.x + something.width
        something_final_y = something.y + something.height

        for points in self_points
            point_x = points[0]
            point_y = points[1]
            if something.x <= point_x && point_x < something_final_x
                if something.y <= point_y && point_y < something_final_y
                    return true
                end
            end
        end

        return false

    end

end