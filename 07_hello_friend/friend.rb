class Friend
  def greeting(name = '')
    words = 'Hello'
    words += ', ' unless name.empty?
    words += name + '!'
  end
end