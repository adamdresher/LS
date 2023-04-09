class Machine

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def status
    "The machine is #{switch}."
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

ava = Machine.new
ava.start
p ava.status # :on
ava.stop
p ava.status # :off
