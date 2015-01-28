module ApplicationHelper
  def form_group_tag(errors)
    if errors.any?
      "form-group has-error"
    else
      "form-group"
    end
  end


  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocs: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  #making _voter partial cleaner.
  def up_vote_link_classes(post)
    "glyphicon glyphicon-chevron-up #{(current_user.voted(post) && current_user.voted(post).up_vote?) ? 'voted' : '' }"
  end

  def down_vote_link_classes(post)
    "glyphicon glyphicon-chevron-down #{(current_user.voted(post) && current_user.voted(post).down_vote?) ? 'voted' : '' }"
  end


end
