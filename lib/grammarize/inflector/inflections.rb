require 'thread_safe'

module Grammarize

  module Inflector

    extend self

    def inflections(locale = :en)
      if block_given?
        yield Inflections.instance(locale)
      else
        Inflections.instance(locale)
      end
    end

    class Inflections
      @__instance__ = ThreadSafe::Cache.new

      def self.instance(locale = :en)
        @__instance__[locale] ||= new
      end

      attr_reader :genders, :persons

      def initialize
        @genders, @persons = [], []
      end

      def person(first, second, third)
        @persons.prepend([first, second, third])
      end

      def gender(male, female, neutra=nil)
        @genders.prepend([male, female, neutra])
      end

      def clear(scope = :all)
        case scope
          when :all
            @genders, @persons = [], []
          else
            instance_variable_set "@#{scope}", []
        end
      end
    end
  end
end
