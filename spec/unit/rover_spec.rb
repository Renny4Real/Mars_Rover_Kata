# frozen_string_literal: true

describe Rover do
  context 'it can move forwards and backwards' do
    it 'can return its current position at (O,O)' do
      rover = Rover.new(0, 0, :S)
      location = rover.position

      expect(location).to eq(x: 0, y: 0, direction: :S)
    end

    it 'can move from (0,0) to (0,1)' do
      rover = Rover.new(0, 0, :S)
      rover.move(['f', 1])
      location = rover.position

      expect(location).to eq(x: 0, y: 1, direction: :S)
    end

    it 'can move from (0,0) to (0,1) and then to (0,2)' do
      rover = Rover.new(0, 0, :S)
      rover.move(['f', 1], ['f', 1])
      location = rover.position

      expect(location).to eq(x: 0, y: 2, direction: :S)
    end

    it 'can move from (0,0) to (0,3)' do
      rover = Rover.new(0, 0, :S)
      rover.move(['f', 1], ['f', 2])
      location = rover.position

      expect(location).to eq(x: 0, y: 3, direction: :S)
    end

    it 'can move from (0,3) back to (0,2)' do
      rover = Rover.new(0, 0, :S)
      rover.move(['f', 1], ['f', 2], ['b', 1])
      location = rover.position

      expect(location).to eq(x: 0, y: 2, direction: :S)
    end

    it 'can move from (0,3) back to (0,0)' do
      rover = Rover.new(0, 0, :S)
      rover.move(['f', 1], ['f', 1], ['f', 1], ['b', 3])
      location = rover.position

      expect(location).to eq(x: 0, y: 0, direction: :S)
    end
  end

  context 'it can turn left or right' do
    context 'turn left' do
      it 'can change from facing the south to facing the east' do
        rover = Rover.new(0, 0, :S)
        rover.turn('l')
        rover.move(['f', 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :E)
      end

      it 'can change from facing the east to facing the north' do
        rover = Rover.new(0, 0, :E)
        rover.turn('l')
        rover.move(['f', 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :N)
      end

      it 'can change from facing the north to facing the west' do
        rover = Rover.new(0, 0, :N)
        rover.turn('l')
        rover.move(['f', 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :W)
      end

      it 'can change from facing the west to facing the south' do
        rover = Rover.new(0, 0, :W)
        rover.turn('l')
        rover.move(['f', 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :S)
      end
    end

    context 'turn right' do
      it 'can change from facing the south to facing the west' do
        rover = Rover.new(0, 0, :S)
        rover.turn('r')
        rover.move(['f', 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :W)
      end

      it 'can change from facing the west to facing the north' do
        rover = Rover.new(0, 0, :W)
        rover.turn('r')
        rover.move(['f', 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :N)
      end

      it 'can change from facing the north to facing the east' do
        rover = Rover.new(0, 0, :N)
        rover.turn('r')
        rover.move(['f', 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :E)
      end

      it 'can change from facing the east to facing the south' do
        rover = Rover.new(0, 0, :E)
        rover.turn('r')
        rover.move(['f', 0])
        location = rover.position

        expect(location).to eq(x: 0, y: 0, direction: :S)
      end
    end
  end
end
