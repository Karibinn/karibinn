# frozen_string_literal: true

module MarkdownHelper
  def render_markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)

    markdown.render(text).html_safe
  end
end
