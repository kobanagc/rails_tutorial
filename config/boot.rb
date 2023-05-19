ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.

# boot.rbはアプリケーションのブートストラッピング（初期化）を担当。
# このファイルでRailsアプリケーションが必要とする環境やライブラリがロードされ、設定される。
# 具体的には、以下のような設定や操作が boot.rb で行われる

# 1.Bundler（Rubyの依存関係管理ツール）のセットアップ
# 2.Railsの各種環境設定のロード

# なお、boot.rbの後にconfig/application.rbが読み込まれ、アプリケーション固有の設定が行われる。
# さらに、それぞれの環境（開発、テスト、本番など）に対応する
# 設定ファイル（config/environments/development.rbなど）が読み込まれる。
# 以上のプロセスを通じて、Railsアプリケーションは適切に初期化され、起動する。