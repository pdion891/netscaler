require 'netscaler/netscaler_service'

module Netscaler
  class Ssl
    class Certkey < NetscalerService
      def initialize(netscaler)
        @netscaler = netscaler
      end

      def add(payload={})
        raise ArgumentError, 'payload cannot be null' if payload.nil?
        validate_payload(payload, [:certkey, :cert, :key])
        return @netscaler.adapter.post('config/sslcertkey', { 'sslcertkey' => payload })
      end

      def remove(payload={})
        raise ArgumentError, 'payload cannot be null' if payload.nil?
        validate_payload(payload, [:certkey])
        return @netscaler.adapter.delete("config/sslcertkey/#{payload[:certkey]}")
      end
    end
  end
end
