##
# Middleman configuration file
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://hellojason.net/blog/remove-unused-css-from-middleman-before-deploying/
##

# Variables
set :partials_dir,   "partial/_codeBlender"
set :layout_dir,     "_codeBlender/"
set :layout,         "_codeBlender/fullWidth"

set :relative_links, true
set :haml,         { ugly: true, format: :html5 }
set :debug_assets, true

set :css_dir,          "assets/stylesheets"
set :js_dir,           "assets/javascripts"
set :images_dir,       "assets/images"

# Markdown Engine
set :markdown, layout_engine: :haml, tables: true, autolink: true, smartypants: true
set :markdown_engine, :kramdown

# Time Zone
Time.zone = "Europe/London"

# I18n
# @see http://www.rubydoc.info/github/svenfuchs/i18n/I18n
activate :i18n

# Sprockets
activate :sprockets

# Sprockets
after_configuration do
    sprockets.append_path File.join( root, "bower_components" )
    sprockets.append_path File.join( root, "source/partial/_codeBlender/atom" )
    sprockets.append_path File.join( root, "source/partial/_codeBlender/organism" )
end

# Middleman Deploy
# @see https://github.com/middleman-contrib/middleman-deploy
activate :deploy do | deploy |
    deploy.deploy_method = :git
end

# Build-specific configuration
configure :build do

    # # GZIP Files
    # @see https://middlemanapp.com/advanced/file_size_optimization/
    activate :gzip

    # Use relative URLs
    activate :relative_assets

    # For example, change the Compass output style for deployment
    activate :minify_css, inline: true

    # Minimise JavaScript on build
    # @see https://github.com/crtvhd/middleboy
    activate :minify_javascript
    # activate :minify_javascript, inline: true, compressor: Uglifier.new( mangle: false, comments: :none )

    # Minimise HTML
    # https://github.com/middleman/middleman-minify-html
    activate :minify_html

end
