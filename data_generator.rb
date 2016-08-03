require 'yaml'
class DataGenerator
  def generate
    data = []
    100_000.times do
      data << [rand(1000), rand(1000)]
    end
    data = data.to_yaml
    File.open('100k.txt', 'w') do |file|
      file.write data
    end
  end
end

new_generator = DataGenerator.new
new_generator.generate
