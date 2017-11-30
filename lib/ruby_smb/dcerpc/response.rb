module RubySMB
  module Dcerpc

    class Response < BinData::Record
      endian :little

      #common fields
      uint8 :rpc_vers # 00:01 RPC version
      uint8 :rpc_vers_minor # 01:01 minor version
      uint8 :ptype # 02:01 request PDU
      uint8 :pfc_flags # 03:01 flags

      uint32 :packed_drep # 04:04 NDR data rep format label

      uint16 :frag_length # 08:02 total length of fragment
      uint16 :auth_length # 10:02 length of auth_value
      uint32 :call_id # 12:04 call identifier

      #needed on request, response, fault

      uint32 :alloc_hint # 16:04 allocation hint
      uint16 :p_cont_id # 20:02 pres context, i.e. data rep
      uint16 :cancel_count # 22:02 operation #within the interface

      # optional field for request, only present if the PFC_OBJECT_UUID field is non-zero

      string :stub, length: -> {alloc_hint}

      # stub data, 8-octet aligned

      # optional authentication verifier
      # following fields present iff auth_length != 0 */

      #auth_verifier_co_t   auth_verifier # xx:yy
    end
  end
end
