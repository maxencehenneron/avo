module Avo
  module Fields
    class TrixField < BaseField
      attr_reader :always_show
      attr_reader :attachments_disabled
      attr_reader :attachment_key
      attr_reader :hide_attachment_filename
      attr_reader :hide_attachment_filesize
      attr_reader :hide_attachment_url

      def initialize(id, **args, &block)
        super(id, **args, &block)

        hide_on :index

        @always_show = args[:always_show] || false
        @attachment_key = args[:attachment_key]
        # If we don't have an attachment_key, we disable attachments.  There's no point in having
        # attachments if we can't store them.
        @attachments_disabled = args[:attachments_disabled] || true
        @attachments_disabled = false unless @attachment_key.present?
        @hide_attachment_filename = args[:hide_attachment_filename] || false
        @hide_attachment_filesize = args[:hide_attachment_filesize] || false
        @hide_attachment_url = args[:hide_attachment_url] || false
      end
    end
  end
end
