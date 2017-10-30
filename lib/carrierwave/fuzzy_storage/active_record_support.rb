# frozen_string_literal: true

module CarrierWave
  module FuzzyStorage
    class ActiveRecordSupport < Module
      def initialize(default_storage, *mounted_fields)
        @default_storage = default_storage
        @mounted_fields = mounted_fields.flatten.map(&:to_sym)
      end

      def included(base)
        storage = @default_storage
        mounted_fields = @mounted_fields

        mounted_fields.each do |field|
          base.send(:define_method, "#{field}_storage") do
            super() || storage
          end
        end

        base.before_create do
          mounted_fields.each do |field|
            public_send("#{field}_storage=", storage)
          end
        end
      end
    end
  end
end
