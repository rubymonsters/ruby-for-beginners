require 'middleman_toc'

set :layouts_dir, '/layouts'
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'images'
set :source, 'source'

page '/sitemap.xml', layout: false
page '/solutions/*', :layout => false

ignore(/themes\/(?!#{data.book.theme.downcase}).*/)
config.ignored_sitemap_matchers[:layout] = proc { |file|
  file.start_with?(File.join(config.source, 'layout.')) || file.start_with?(File.join(config.source, 'layouts/')) || !!(file =~ /themes\/.*\/layouts\//)
}

activate :syntax
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true, :no_intra_emphasis => true, :autolink => true, :strikethrough => true, :tables => true

set :relative_links, true
activate :relative_assets
activate :minify_css
activate :minify_javascript
activate :asset_hash
activate :toc

helpers do
  def discover_page_title(page = current_page)
    if page.data.title
      return page.data.title # Frontmatter title
    elsif page.url == '/'
      return data.book.title
    elsif match = page.render(layout: false, no_images: true).match(/<h.+>(.*?)<\/h1>/)
      return match[1] + ' | ' + data.book.title
    else
      filename = page.url.split(/\//).last.gsub('%20', ' ').titleize
      return filename.chomp(File.extname(filename)) + ' | ' + data.book.title
    end
  end

  def link_to_if_exists(*args, &block)
    url = args[0]

    resource = sitemap.find_resource_by_path(url)
    if resource.nil?
      block.call
    else
      link_to(*args, &block)
    end
  end
end
