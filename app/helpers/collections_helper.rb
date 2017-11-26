module CollectionsHelper
  def options_for_sex_select
    User.sexes.keys.map {|sex| [sex.humanize, sex]}
  end
end
