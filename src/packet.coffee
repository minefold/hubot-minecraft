assert   = require 'assert'
Iconv    = require('iconv').Iconv
Protocol = require('./protocol')

class exports.Packet
  @sizeOfByte   = -> 1
  @sizeOfShort  = -> 2
  @sizeOfInt    = -> 4
  @sizeOfLong   = -> @sizeOfDouble()
  @sizeOfFloat  = -> 4
  @sizeOfDouble = -> 8
  @sizeOfBool   = -> 1
  @sizeOfStr    = (str) -> @sizeOfShort() + Buffer.byteLength(str, 'ucs2')

  constructor: (@header) ->
    @idx = 0
    @schema = Protocol.SCHEMAS[@header]
    @iconv = new Iconv('UTF-8', 'UCS-2BE')

  sizeOf: (payload) ->
    (@constructor["sizeOf#{type}"](payload[i]) for type, i in @schema)
      .reduce ((c, n) -> c + n), @constructor.sizeOfByte()

  writeByte: (byte) ->
    @buf.writeUInt8(byte, @idx)
    @idx += @constructor.sizeOfByte()

  writeShort: (short) ->
    @buf.writeInt16BE(short, @idx)
    @idx += @constructor.sizeOfShort()

  writeInt: (int) ->
    @buf.writeInt32BE(int, @idx)
    @idx += @constructor.sizeOfInt()

  writeLong: (longStr) ->
    @writeDouble(parseInt(longStr, 10))

  writeFloat: (float) ->
    @buf.writeFloatBE(float, @idx)
    @idx += @constructor.sizeOfFloat()

  writeDouble: (double) ->
    @buf.writeDoubleBE(double, @idx)
    @idx += @constructor.sizeOfDouble()

  writeStr: (str) ->
    @writeShort(str.length)

    strBuf = @iconv.convert(str)
    strBuf.copy(@buf, @idx, 0)

    @idx += strBuf.length


  build: (payload...) ->
    @buf = new Buffer(@sizeOf(payload))

    @writeByte(@header)

    for type, i in @schema
      @["write#{type}"](payload[i])

    @idx = 0
    @buf
