class Timer
    def initialize(interval)
        @interval = interval
        @last_recorded_second = 0
    end

    def tick

        second = Gosu::milliseconds/1000

        its_time = (second % @interval == 0)

        can_tick = (second != @last_recorded_second)

        if its_time && can_tick
            @last_recorded_second = second
            return true
        else
            return false
        end
    end

end