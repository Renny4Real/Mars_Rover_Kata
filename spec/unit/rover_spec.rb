# frozen_string_literal: true

describe Rover do
  context 'it can move forwards and backwards' do
    context 'can move along the y - axis' do
      it 'can return its current position at (O,O) facing south' do
        rover = Rover.new(0, 0, :South)
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :South)
      end

      it 'can move from (0,0) to (0,1) facing south' do
        rover = Rover.new(0, 0, :South)
        rover.move([:forward, 1])
        location = rover.position

        expect(location).to eq(x: 0, y: 1, direction: :South)
      end

      it 'can move from (0,0) to (0,1) and then to (0,2) facing south' do
        rover = Rover.new(0, 0, :South)
        rover.move([:forward, 1], [:forward, 1])
        location = rover.position

        expect(location).to eq(x: 0, y: 2, direction: :South)
      end

      it 'can move from (0,0) to (0,3) facing south' do
        rover = Rover.new(0, 0, :South)
        rover.move([:forward, 1], [:forward, 2])
        location = rover.position

        expect(location).to eq(x: 0, y: 3, direction: :South)
      end

      it 'can move from (0,3) back to (0,2) facing north' do
        rover = Rover.new(0, 0, :South)
        rover.move([:forward, 1], [:forward, 2], [:backward, 1])
        rover.turn(:left)
        rover.turn(:left)
        location = rover.position

        expect(location).to eq(x: 0, y: 2, direction: :North)
      end

      it 'can move from (0,3) back to (0,0)' do
        rover = Rover.new(0, 0, :South)
        rover.move([:forward, 1], [:forward, 1], [:forward, 1], [:backward, 3])
        rover.turn(:right)
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :West)
      end
    end

    context 'can move along the x - axis' do
      it 'can move from (0,0) to (1,0) facing east' do
        rover = Rover.new(0, 0, :South)
        rover.turn(:left)
        rover.move([:forward, 1])
        location = rover.position

        expect(location).to eq(x: 1, y: 0, direction: :East)
      end

      it 'can move from (1,0) to (0,0) facing east' do
        rover = Rover.new(1, 0, :South)
        rover.turn(:left)
        rover.move([:backward, 1])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :East)
      end

      it 'can move from (2,2) to (2,1) facing west' do
        rover = Rover.new(2, 2, :South)
        rover.turn(:right)
        rover.move([:forward, 1])
        location = rover.position

        expect(location).to eq(x: 1, y: 2, direction: :West)
      end

      it 'can move from (2,2) to (0,0) facing north' do
        rover = Rover.new(2, 2, :South)
        rover.turn(:right)
        rover.turn(:right)
        rover.move([:forward, 2])
        rover.turn(:left)
        rover.move([:forward, 2])
        rover.turn(:right)
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :North)
      end
    end
  end

  context 'it can turn left or right' do
    context 'can turn left' do
      it 'can change from facing the south to facing the east' do
        rover = Rover.new(0, 0, :South)
        rover.turn(:left)
        rover.move([:forward, 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :East)
      end

      it 'can change from facing the east to facing the north' do
        rover = Rover.new(0, 0, :East)
        rover.turn(:left)
        rover.move([:forward, 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :North)
      end

      it 'can change from facing the north to facing the west' do
        rover = Rover.new(0, 0, :North)
        rover.turn(:left)
        rover.move([:forward, 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :West)
      end

      it 'can change from facing the west to facing the south' do
        rover = Rover.new(0, 0, :West)
        rover.turn(:left)
        rover.move([:forward, 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :South)
      end
    end

    context 'can turn right' do
      it 'can change from facing the south to facing the west' do
        rover = Rover.new(0, 0, :South)
        rover.turn(:right)
        rover.move([:forward, 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :West)
      end

      it 'can change from facing the west to facing the north' do
        rover = Rover.new(0, 0, :West)
        rover.turn(:right)
        rover.move([:forward, 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :North)
      end

      it 'can change from facing the north to facing the east' do
        rover = Rover.new(0, 0, :North)
        rover.turn(:right)
        rover.move([:forward, 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :East)
      end

      it 'can change from facing the east to facing the south' do
        rover = Rover.new(0, 0, :East)
        rover.turn(:right)
        rover.move([:forward, 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :South)
      end
    end
  end
end
