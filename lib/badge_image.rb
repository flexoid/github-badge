require 'RMagick'

class BadgeImage
  class << self
    def make_badge(info)
      img = Magick::ImageList.new './templates/template.png'

      text = Magick::Draw.new
      text.gravity = Magick::SouthGravity
      text.pointsize = 25
      text.stroke = '#000000'
      text.fill = '#ffffff'
      text.font_weight = Magick::BoldWeight

      img.annotate(text, 0, 0, 0, 0, "#{info.followers}")
      img.to_blob
    end
  end
end
