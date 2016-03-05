module ActiveAdminHelpers
  # make this method public (compulsory)
  def self.included(dsl)
    # nothing ...
  end

  # define helper methods here ...
  def convert_status(status)
    case status
    when 'pending'   then 'В ожидании'
    when 'shipped'   then 'Отправлен'
    when 'completed' then 'Завершен'
    when 'cancelled'   then 'Отменен'
    end
  end
end