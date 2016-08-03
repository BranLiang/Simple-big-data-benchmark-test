require 'yaml'
require 'benchmark'
require_relative 'benchmark_class.rb'

class TestClass
  def prepare_work
    points = []
    data = YAML::load(File.open('100k.txt', 'r'))
    data.each do |point|
      points << Coordinate.new(point[0], point[1])
    end
    points
  end

  def distance point1, point2
    Math.sqrt((point1.x - point2.x) ** 2 + (point1.y - point2.y) ** 2)
  end

  def test
    test_data1 = prepare_work
    test_data2 = test_data1.reverse
    test_time = Benchmark.measure do
      test_data1.each_index do |index|
        distance test_data1[index], test_data2[index]
      end
    end
    puts test_time
  end

end

new_test = TestClass.new
new_test.test
