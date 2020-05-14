module ApplicationHelper
  def money_vn_format(number)
    number_to_currency(number, separator: '.', unit: 'VND', precision: 0, format: "%n %u")
  end

  # def print_pretty_array(myarray)

  # end
end
