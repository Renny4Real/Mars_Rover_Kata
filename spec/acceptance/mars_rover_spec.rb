describe 'the movement of a Mars Rover' do
  it'can move a rover forward on square south of its position at (0,0)' do
    rover = Rover.new(0,0,:S)
    rover.move(['f', 1])

    expect(rover.position).to eq(x: 0, y: 1, direction: :S )
  end
end
