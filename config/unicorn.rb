# -*- coding: utf-8 -*-

# Unicornのプロセスがリッスンするアドレスとポート指定
listen '127.0.0.1:3000'

# pidファイルの場所を指定
pid 'tmp/pids/unicorn.pid'

# ワーカーの数を指定
worker_processes 2

# リクエストのタイムアウト秒を指定する
timeout 15

# ダウンタイムをなくすため、アプリをプリロード
preload_app true

# Unicornのログ出力先を指定
ROOT = File.dirname(File.dirname(__FILE__))
stdout_path "#{ROOT}/log/unicorn-stdout.log"
stderr_path "#{ROOT}/log/unicorn-stderr.log"

# Unicornのプロセスがフォークする前の挙動を指定
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENONET, Errno::ESRCH
    end
  end
end

# Unicornのプロセスがフォークした後の挙動を指定
after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end