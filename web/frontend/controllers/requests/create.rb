require 'domain'

module Frontend::Controllers::Requests
  class Create
    include Frontend::Action

    expose :notification

    def call(params)
      form = Frontend::RequestForm.new(Domain::Request.new)
      request = form.fill_with!(params, self)
      repository.persist(request)
      redirect_to Frontend::Routes.path(:home)
    end

    def form_invalid
      halt 422
    end

    private

    def repository
      Domain::Repositories::RequestRepository
    end
  end
end
