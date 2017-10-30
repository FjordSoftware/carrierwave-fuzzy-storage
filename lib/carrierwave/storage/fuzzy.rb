# frozen_string_literal: true

module CarrierWave
  module Storage
    class Fuzzy

      attr_reader :final_storage

      def initialize(uploader)
        storage = uploader.model.public_send("#{uploader.mounted_as}_storage")
        storage_engine = uploader.storage_engines.fetch(storage.to_sym).constantize
        @final_storage = storage_engine.new(uploader)
      end

      delegate \
        :cache!,
        :clean_cache!,
        :delete_dir!,
        :identifier,
        :retrieve!,
        :retrieve_from_cache,
        :store!,
        to: :final_storage
    end
  end
end
