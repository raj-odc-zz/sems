# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.


@names = []

def get_dir_files(file_path)
  if File.directory?(file_path)
      Dir.glob("#{file_path}/*").each { |file_or_dir| get_dir_files(file_or_dir) }
   else
      @names << file_path.gsub!("app/assets/","").gsub!(/(stylesheets\/|javascripts\/|images\/)/,"")
  end
end
Dir.glob("app/assets/*").each { |file_or_dir| get_dir_files(file_or_dir) }

Rails.application.config.assets.precompile += @names.flatten.compact.uniq
