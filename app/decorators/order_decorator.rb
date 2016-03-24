class OrderDecorator < Draper::Decorator
  delegate_all
  
  def created_at
    object.created_at.strftime("%d.%m.%Y")
  end

  def invoice_created_at
    object.created_at.strftime("%m/%d/%Y")
  end

  def invoice_condensed_date(count)
    object.created_at.strftime("%m/%d/") + count.to_s # 12/18/6 => 6 is sum of all invoices
  end

  def invoice_from_date
    number = object.created_at.day
    month = get_month_name(object.created_at.month)
    year = object.created_at.year
    "#{number} #{month} #{year}"
  end

  def contact_info
    address = "#{company_name}, ИНН #{inn}, КПП #{kpp}, "
    address + "#{city} г, " if city
    address + "#{street} ул, " if street
    address + "дом №#{building}#{block}, " if building
    address + "кв. #{apt}," if apt
    address + "#{name} тел.: #{tel}"
  end

  private

  def get_month_name(month)
    case month 
    when 1 then 'января'
    when 2 then 'февраля'
    when 3 then 'марта'
    when 4 then 'апреля'
    when 5 then 'мая'
    when 6 then 'июня'
    when 7 then 'июля'
    when 8 then 'августа'
    when 9 then 'сентября'
    when 10 then 'октября'
    when 11 then 'ноября'
    when 12 then 'декабря'
    end
  end
end
