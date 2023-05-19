require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsTutorial
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # 認証トークンをremoteフォームに埋め込む
    config.action_view.embed_authenticity_token_in_remote_forms = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

# config/boot.rbの後にconfig/application.rb（このファイル）が読み込まれ、アプリケーション固有の設定が行われる。
# 例えば、各種コンポーネントの読み込み、ミドルウェアの設定、ジェネレータの設定などがここで行われる。

# 次に現在の実行環境（開発、テスト、本番など）に応じた設定ファイル
# （config/environments/development.rb、config/environments/test.rb、
# config/environments/production.rbなど）が読み込まれる。ここでは、特定の環境に対する設定
# （ログの詳細レベル、キャッシュの有無、メール配信の設定など）が行われる。

# 例えば、開発環境でRailsサーバーを起動した場合、config/application.rbが読み込まれた後に
# config/environments/development.rbが読み込まれる。
# テスト環境であればconfig/environments/test.rbが、
# 本番環境であれば config/environments/production.rbが読み込まれる。

# Railsは起動時の環境を判断するために、環境変数RAILS_ENVをチェックする。
# RAILS_ENVは、アプリケーションが現在どの環境（開発、テスト、本番など）で動いているかを示すためのもの。
# この環境変数の値に基づいて、対応する環境設定ファイル（config/environments/development.rb、
# config/environments/test.rb、config/environments/production.rbなど）が読み込まれる。

# 例えば、開発環境でRailsアプリケーションを起動するときには、以下のようにRAILS_ENVを設定する

# RAILS_ENV=development rails server
# RailsではRAILS_ENVが指定されていない場合は、デフォルトで開発環境（development）とみなされる。
# そのため、開発環境で起動する場合は、単に以下のようにコマンドを実行するだけでもOK。

# rails server

# これに対して、本番環境で起動する場合は、RAILS_ENVをproductionに設定
# RAILS_ENV=production rails server