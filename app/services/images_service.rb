class ImagesService

  def self.get_images(country)
    response = conn.get('api/') do |f|
      f.params[:key] = ENV['IMAGE_API_KEY']
      f.params[:q] = country
      f.params[:image_type] = 'photo'
      f.params[:orientation] = 'horizontal'
      f.params[:category] = 'travel'
      f.params[:order] = 'popular'
    end

    json = JSON.parse(response.body, symbolize_names: true)

    {
      images: json[:hits].sample(5),
      other:
        { source: 'pixabay.com', logo: 'https://pixabay.com/static/img/logo_square.png' }
    }
  end

  def self.conn
    Faraday.new('https://pixabay.com')
  end
end
