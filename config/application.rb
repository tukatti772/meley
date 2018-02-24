require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Outputs
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    #デフォルトのタイムゾーンはUTCになってて、データベースにそれを書き込むから時間がずれる。下記で修正
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    #バリデーションのエラーメッセージを日本語化
    config.i18n.default_locale = :ja

    #バリデーションのエラー部に付加されるdiv class="field_with_errors"を生成しないようにする。
    #スタイルが崩れるのを防止するため。
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      %Q(#{html_tag}).html_safe
    end

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # 認証トークンをremoteフォームに埋め込む。ブラウザでJSがoffになっててもこうすると動作するらしい。勉強必要。
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
