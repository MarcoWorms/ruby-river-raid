class Bullet_manager

	def initialize
		@bullets = []
		@bullet_image = Gosu::Image.new('bullet.png')
	end

	def update
        # Todas as bullets são guardadas dentro de uma array
        # que no caso é @bullets. Cada bullet é um dicionário
        # com 2 index, eu fiz assim para ficar mais facil de
        # deletar as bullets da array. Os index são X e Y, ou
        # seja, uma bullet não passa de um dicionário com 2
        # valores dentro da array. Pense no dicionário aqui como
        # uma maneira de dar 2 (X e Y) valores para uma variavel
		for bullet in @bullets
			bullet["y"] -= 4
            check_out_of_bounds_and_kill(bullet)
		end
	end

	def draw
		for bullet in @bullets
            # Como as bullets não passam de um simples valor
            # X e Y, aqui desenhamos uma imagem para cada bullet,
            # na verdade só desenhamos várias imagens utilizando
            # os diversos X e Y que temos dentro da nossa array.
			@bullet_image.draw(bullet["x"], bullet["y"], 2)
		end
	end

    def spawn(plane_center_x)
        bullet_center_x = @bullet_image.width/2
        spawn_x = plane_center_x - bullet_center_x

        # Aqui criamos as bullets, ou seja, colocamos um
        # dicionário com 2 elementos dentro da array, e
        # cada elemento da array é um dicionário.
        @bullets.push({"x" => spawn_x, "y" => 500})
    end

    def check_out_of_bounds_and_kill(bullet)
        bullet_height = @bullet_image.height
        if bullet["y"] <= -bullet_height
        # Aqui é onde eu tiro facilmente uma bullet da array
        # pois nunca existirá 2 bullets com o mesmo X e Y.
        # Creio que isso justifica o método que usei.
            @bullets -= [bullet]
        end
    end

end