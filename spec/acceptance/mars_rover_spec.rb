# frozen_string_literal: true

describe 'the movement of a Mars Rover' do
  it' moves a rover forward 1 space south of its initial position at (0,0), then turns left and moves 2 spaces to the east' do
    rover = Rover.new(0, 0, :South)
    rover.move([:forward, 1])
    rover.turn(:left)
    rover.move([:forward, 2])

    expect(rover.position).to eq(x: 2, y: 1, direction: :East)
  end
end
