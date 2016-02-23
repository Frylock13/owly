class PostDecorator < Draper::Decorator
  delegate_all

  include Rails.application.routes.url_helpers

  def created_at
    object.created_at.strftime("%d.%m.%Y")
  end
end
