require 'rspec'
require_relative 'sky'

describe Sky do
  it('can render itself in a frame') do
    sky = Sky.new([
      'position=< 9,  1> velocity=< 0,  2>',
      'position=< 7,  0> velocity=<-1,  0>',
      'position=< 3,  2> velocity=<-1,  1>'
    ])

    expect(sky.render_at(time:0, x: 0, y:0, height: 10, width: 10)).to eq <<-EOF.chomp
.......#..
.........#
...#......
..........
..........
..........
..........
..........
..........
..........
EOF

  end

  it 'will automatically fit all particles to the frame' do

    sky = Sky.new([
      'position=< 9,  1> velocity=< 0,  2>',
      'position=< 7,  0> velocity=<-1,  0>',
      'position=< 3,  2> velocity=<-1,  1>'
    ])

    expect(sky.render_at(time:0)).to eq <<-EOF.chomp
....#..
......#
#......
EOF
  end

  it('knows the size needed along each axis to render') do
    sky = Sky.new([
      'position=< 9,  1> velocity=< 0,  2>',
      'position=< 7,  0> velocity=<-1,  0>',
      'position=< 3,  2> velocity=<-1,  1>'
    ])

    expect(sky.required_height(0)).to eq 3
    expect(sky.required_width(0)).to eq 7
  end

  it('can find the next time it has increasing size') do
    sky = Sky.new([
      'position=< 9,  1> velocity=< 0,  2>',
      'position=< 7,  0> velocity=<-1,  0>',
      'position=< 3, -2> velocity=<-1,  1>',
      'position=< 6, 10> velocity=<-2, -1>',
      'position=< 2, -4> velocity=< 2,  2>',
      'position=<-6, 10> velocity=< 2, -2>',
      'position=< 1,  8> velocity=< 1, -1>',
      'position=< 1,  7> velocity=< 1,  0>',
      'position=<-3, 11> velocity=< 1, -2>',
      'position=< 7,  6> velocity=<-1, -1>',
      'position=<-2,  3> velocity=< 1,  0>',
      'position=<-4,  3> velocity=< 2,  0>',
      'position=<10, -3> velocity=<-1,  1>',
      'position=< 5, 11> velocity=< 1, -2>',
      'position=< 4,  7> velocity=< 0, -1>',
      'position=< 8, -2> velocity=< 0,  1>',
      'position=<15,  0> velocity=<-2,  0>',
      'position=< 1,  6> velocity=< 1,  0>',
      'position=< 8,  9> velocity=< 0, -1>',
      'position=< 3,  3> velocity=<-1,  1>',
      'position=< 0,  5> velocity=< 0, -1>',
      'position=<-2,  2> velocity=< 2,  0>',
      'position=< 5, -2> velocity=< 1,  2>',
      'position=< 1,  4> velocity=< 2,  1>',
      'position=<-2,  7> velocity=< 2, -2>',
      'position=< 3,  6> velocity=<-1, -1>',
      'position=< 5,  0> velocity=< 1,  0>',
      'position=<-6,  0> velocity=< 2,  0>',
      'position=< 5,  9> velocity=< 1, -2>',
      'position=<14,  7> velocity=<-2,  0>',
      'position=<-3,  6> velocity=< 2, -1>'
    ])

    expect(sky.time_of_smallest_width(0..20)).to eq 3
  end
end

