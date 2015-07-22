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

      attr_reader :males, :females, :neutrals

      def initialize
        @males, @females, @neutrals, @firsts, @seconds, @thirds = [], [], [], [], [], []
      end

      def male(rule, replacement)
        @males.prepend([rule.downcase, replacement.downcase])
      end

      def female(rule, replacement)
        @females.prepend([rule.downcase, replacement.downcase])
      end

      def neutra(rule, replacement)
        @neutrals.prepend([rule.downcase, replacement.downcase])
      end

      def first(rule, replacement)
        @firsts.prepend([rule.downcase, replacement.downcase])
      end

      def second(rule, replacement)
        @seconds.prepend([rule.downcase, replacement.downcase])
      end

      def third(rule, replacement)
        @thirds.prepend([rule.downcase, replacement.downcase])
      end

      def person(first, second, third)

        #first person
        first(second, first)
        first(third, first)
        first(first, first)

        #second person
        second(first, second)
        second(third, second)
        second(second, second)

        #third person
        third(first, third)
        third(second, third)
        third(third, third)

      end

      def role(male, female, neutra=nil)

        #females
        female(male, female)
        female(female, female)
        female(neutra, female) unless neutra.blank?

        #males
        male(female, male)
        male(male, male)
        male(neutra, male) unless neutra.blank?

        #neutrals
        unless neutra.blank?

          neutra(female, neutra)
          neutra(male, neutra)
          neutra(neutra, neutra)

        end

      end

      def clear(scope = :all)
        case scope
          when :all
            @males, @females, @neutras = [], [], []
          else
            instance_variable_set "@#{scope}", []
        end
      end
    end
  end
end
