def score(frames)
  score = 0

  for frame_index in (0..frames.length-1)
    frame = frames[frame_index]

    score += frame[0] + frame[1]        
    if score == 10 
      next_frame = frames[frame_index +1]
      score += next_frame[0] + next_frame[1]
    end
  end

  score
end

describe 'Bowling Game' do
  it 'has score 0 when no pins are knocked down' do
    no_pins_are_knocked_down = [[0, 0]] * 10
    expect(score(no_pins_are_knocked_down)).to eq(0)
  end

  it 'has score 1 when a pin is knocked down' do
    frames = [[1, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0,0]]
    expect(score(frames)).to eq(1)
  end

  it 'has score 5 when 5 pins knocked down with no spares/strikes' do 
    frames = [[1, 0], [0, 0], [0, 2], [0, 0], [1, 0], [0, 0], [0, 0], [0, 0], [1,0]]
    expect(score(frames)).to eq(5)
  end

  it 'adds next two throws score to the total score when there is a strike' do
    frames = [[10, 0], [1, 1], [0,0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0,0]]
    expect(score(frames)).to eq(14)
  end

end
