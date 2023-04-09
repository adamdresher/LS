class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    # @recordings << yield if block_given?
    record(yield) if block_given?
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { 'Hello world!' }
listener.listen
listener.play
listener.record 'Wubba lubba dub dub!'
listener.play
