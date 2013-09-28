class DevSeeds

  @@dogs_count = 150

  def initialize
    @random = Random.new
    init_breeds
  end

  def seed
    seed_wanted_dogs    
  end

  private
    def seed_wanted_dogs
      @@dogs_count.times do |i|
        WantedDog.create!(name: Faker::Name.first_name, age: Faker::Number.digit, breed: random_breed,
          color: 'black', user: random_user, description: Faker::Lorem.paragraphs(rand(2..8)).join('\n'),
          image: get_dog_image, latitude: random_latitude, longitude: random_longitud)
      end      
    end

    def init_breeds
      @breeds = []
      IO.foreach('db/seeds/dogs_breeds.txt') do |line|
        @breeds << line[0..-2]
      end
    end

    def random_latitude
      rand(-40.000000000...-25.000000000)
    end

    def random_longitud
      rand(-65.000000000...-35.000000000)
    end    

    def random_breed
      @breeds[rand_between(0, @breeds.size - 1)]
    end

    def random_user
      User.order("RAND()").first()
    end

    def get_dog_image
      File.new("app/assets/images/dog_mock.jpg")
    end

    def rand_between(min, max)
      min + (@random.rand() * (max - min)).round(0)
    end

end

WantedDog.delete_all
DevSeeds.new.seed