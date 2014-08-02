require 'digest/md5'

module Pairoulette
  class OfferPresenter
    include Lotus::Presenter

    def short_summary
      shortenize(summary)
    end

    def short_comments
      shortenize(comments)
    end

    def languages
      lang.split
    end

    def gravatar_url
      hash = Digest::MD5.hexdigest(email.downcase)
      "http://www.gravatar.com/avatar/#{hash}"
    end

    private

    def shortenize(string)
      result = string[0..100]
      result << '...' if string.length > 100
      result
    end
  end
end
