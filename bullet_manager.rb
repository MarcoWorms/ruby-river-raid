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
        @y -= 3
    end

    def draw
        @image.draw(@x, @y, 2)
    end

    def is_overlaping?(something)

        # This needs refactoring but it's working exactly as intended.

        bullet_points = {
            "A" => [@x          , @y         ],
            "B" => [@x + @width , @y         ],
            "C" => [@x          , @y + @height],
            "D" => [@x + @width , @y + @height]
        }

        a_x = bullet_points["A"][0]
        a_y = bullet_points["A"][1]
        b_x = bullet_points["B"][0]
        b_y = bullet_points["B"][1]
        c_x = bullet_points["C"][0]
        c_y = bullet_points["C"][1]
        d_x = bullet_points["D"][0]
        d_y = bullet_points["D"][1]
        something_final_x = something.x + something.width
        something_final_y = something.y + something.height

        if something.x <= a_x && something_final_x >= a_x
            if something.y <= a_y && something_final_y >= a_y
                return true
            end
        end

        if something.x <= b_x && something_final_x >= b_x
            if something.y <= b_y && something_final_y >= b_y
                return true
            end
        end

        if something.x <= c_x && something_final_x >= c_x
            if something.y <= c_y && something_final_y >= c_y
                return true
            end
        end

        if something.x <= d_x && something_final_x >= d_x
            if something.y <= d_y && something_final_y >= d_y
                return true
            end
        end

    end

end