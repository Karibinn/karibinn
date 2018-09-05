# frozen_string_literal: true

module MarkdownHelper
  def render_markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)

    # rubocop:disable Rails/OutputSafety
    markdown.render(text).html_safe
    # rubocop:enable Rails/OutputSafety
  end
end
