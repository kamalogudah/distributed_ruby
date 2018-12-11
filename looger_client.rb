require 'drb'

logger = DRbObject.new_with_uri("druby://127.0.0.1:61676")

logger.info "Hello, World!"
