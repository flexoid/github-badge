require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'active_support/all'

require Dir.pwd + '/db/init'
require Dir.pwd + '/lib/github'
require Dir.pwd + '/lib/badge_image'

get '/:user.preview' do
  content_type :json
  info = Github.get_user_info(params[:user])
  content_type 'image/png'
  BadgeImage.decode_badge(BadgeImage.make_badge(info)) unless info.nil?
end

get '/:user' do
  user = params[:user]
  @badge = Badge.first(user: user)
  if @badge.nil? || @badge.updated_at < 5.minutes.ago
    info = Github.get_user_info(user)
    unless info.nil?
      image = BadgeImage.make_badge(info)
      if @badge.nil?
        @badge = Badge.create(user: user, image: image)
      else
        @badge.update(image: image, updated_at: DateTime.now)
      end
    end
  end
  content_type 'image/png'
  BadgeImage.decode_badge(@badge.image) if @badge
end
