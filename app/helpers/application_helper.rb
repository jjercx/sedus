module ApplicationHelper
  def class_enum_for_select class_name, enum_name
    class_name.constantize.send(enum_name.pluralize).keys.map {|k| [k.humanize, k]}
  end
end
