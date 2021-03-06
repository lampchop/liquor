module Liquor
  class Drop::Scope
    include Liquor::External

    attr_reader :source

    def initialize(source)
      unless source.respond_to? :each
        source = source.where(nil)
      end

      @source = source
    end

    # Not exported.
    def to_a
      @source.map do |elem|
        DropDelegation.wrap_element(elem)
      end
    end
    alias to_ary to_a

    def entity
      @source.model_name.to_s
    end
    export :entity

    def find_by(_, fields={})
      fields, = Drop.unwrap_scope_arguments([ fields ])

      result = @source.where(fields).first
      DropDelegation.wrap_element result if result
    end

    def find_all_by(_, fields={})
      fields, = Drop.unwrap_scope_arguments([ fields ])

      result = @source.where(fields)
      DropDelegation.wrap_scope(result)
    end

    export :find_all_by, :find_by

    def except(record)
      record, = Drop.unwrap_scope_arguments([ record ])

      result = @source.where(@source.arel_table[:id].in(record).not)
      DropDelegation.wrap_scope(result)
    end

    def find_except_by(_, fields={})
      fields, = Drop.unwrap_scope_arguments([ fields ])

      result = @source.
        where(fields.map do |key, value|
          @source.arel_table[key].eq(value)
        end.reduce(&:and).not)
      DropDelegation.wrap_scope(result)
    end

    export :except, :find_except_by

    def first
      DropDelegation.wrap_element @source.first
    end

    def last
      DropDelegation.wrap_element @source.last
    end

    def [](index)
      DropDelegation.wrap_element @source[index]
    end

    # Not exported. No block support in Liquor.
    def each
      @source.each do |elem|
        yield DropDelegation.wrap_element(elem)
      end
    end

    # Not exported. No ? in names in Liquor.
    def include?(elem)
      if elem.is_a? Liquor::Drop
        @source.include? elem.source
      else
        false
      end
    end

    def pluck(attribute)
      @source.map do |elem|
        DropDelegation.wrap_element(elem).liquor_send(attribute.to_s, [])
      end
    end

    def count
      @source.count
    end
    alias size count # for builtin compatibility

    export :first, :last, :[], :pluck

    def limit(count)
      DropDelegation.wrap_scope @source.limit(count)
    end

    def offset(count)
      DropDelegation.wrap_scope @source.offset(count)
    end

    def reverse
      DropDelegation.wrap_scope @source.reverse_order
    end

    export :limit, :offset, :reverse
  end
end
