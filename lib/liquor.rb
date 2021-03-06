require "liquor/version"

module Liquor
  require "liquor/diagnostics"
  require "liquor/grammar/lexer"
  require "liquor/grammar/parser"

  require "liquor/runtime"

  require "liquor/ast_tools"
  require "liquor/emitter"
  require "liquor/context"

  require "liquor/tag"
  require "liquor/function"
  require "liquor/external"

  require "liquor/library"

  require "liquor/stdlib/builtin_tags"
  require "liquor/stdlib/builtin_functions"
  require "liquor/stdlib/partial_tags"

  require "liquor/compiler"
  require "liquor/manager"

  if defined?(::ActiveRecord)
    require "liquor/drop/drop"
  end

  if defined?(::Rails)
    require "liquor/extensions/rails"
    require "liquor/extensions/pagination"
  end

  if defined?(::Kaminari)
    require "liquor/extensions/kaminari"
  end

  if defined?(::ThinkingSphinx)
    require "liquor/extensions/thinking_sphinx"
  end
end
