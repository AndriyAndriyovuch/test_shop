module ProductHelper
  def truncate_string(action, string)
    action == 'show' ? string : string.truncate(20, separator: ' ')
  end
end
