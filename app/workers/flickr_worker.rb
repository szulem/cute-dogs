class FlickrWorker

  include Sidekiq::Worker

  def perform
    flickr = FlickRaw::Flickr.new
    counter = 0

    while counter < 100 do
      album = flickr.photos.search(tags: "dog")
      album.reject { |dog| Dog.all.pluck(:image).include?(FlickRaw.url_q(dog))}.each do |obj|
        photo = FlickRaw.url_q(obj)
        new_dog = Dog.new(image: photo, cuteness_score: 0)
        if new_dog.save!
          counter += 1
        end
      end
    end
  end

end