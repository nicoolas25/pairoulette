require 'digest/md5'

module Backend
  class OfferPresenter
    include Lotus::Presenter

    def gravatar_url
      hash = Digest::MD5.hexdigest(email.downcase)
      "http://www.gravatar.com/avatar/#{hash}"
    end

    def f_expires_on
      expires_at.strftime('⇥ %Y-%m-%d')
    end

    def lang_selected(candidate)
      lang == candidate ? 'selected' : '0'
    end
  end
end
