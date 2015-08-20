def criar_thread
    Thread.new {
        self.stop
        sleep 1
        puts "ola"
    }

end

criar_thread
criar_thread
gets

