Time.zone = "Tokyo"

page "/posts/*.html", layout: :post
page "/feed.xml", layout: false

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

Slim::Engine.set_default_options pretty: true
Slim::Engine.set_default_options shortcut: {
  '#' => {tag: 'div', attr: 'id'},
  '.' => {tag: 'div', attr: 'class'},
  '&' => {tag: 'input', attr: 'type'}
}

set :markdown, tables: true, autolink: true, gh_blockcode: true, fenced_code_blocks: true, with_toc_data: true, smartypants: true
set :markdown_engine, :redcarpet

activate :livereload

activate :autoprefixer, browsers: ['last 2 versions', 'ie 8', 'ie 9']

activate :blog do |blog|
  blog.sources = "posts/:year-:month-:day-:title.html"
  blog.default_extension = ".md"
  blog.paginate = false
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :imageoptim
end
