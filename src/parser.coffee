assert   = require 'assert'
Iconv    = require('iconv').Iconv
Int64    = require('node-int64')
Protocol = require('./protocol')

class exports.Parser
  constructor: ->
    @idx = 0
    @iconv = new Iconv('UCS-2BE', 'UTF-8')

  readByte: ->
    byte = @buf.readUInt8(@idx)
    @idx += 1
    byte

  readShort: ->
    short = @buf.readInt16BE(@idx)
    @idx += 2
    short

  readInt: ->
    int = @buf.readInt32BE(@idx)
    @idx += 4
    int

  readLong: ->
    inta = @buf.readInt32LE(@idx)
    @idx += 4
    intb = @buf.readInt32LE(@idx)
    @idx += 4
    (new Int64(intb, inta)).toOctetString()

  readFloat: ->
    float = @buf.readFloatBE(@idx)
    @idx += 4
    float

  readDouble: ->
    double = @buf.readDoubleBE(@idx)
    @idx += 8
    double

  readStr: ->
    chars = @readShort()
    # UCS-2 chars are 16bit
    bytes = chars * 2

    assert(0 <= chars <= 240, "string length is #{chars}")
    raw = @buf.slice(@idx, @idx + bytes)
    str = @iconv.convert(raw).toString()
    @idx += bytes
    str

  readBool: ->
    bool = @readByte()

    assert(bool is 0 or bool is 1, 'bool out of range')

    bool > 0

  readMetadata: (metadata=[]) ->
    byte = @readByte()
    metadata.push(byte)
    if byte isnt 127
      @readMetadata(metadata)
    else
      return metadata

  readSlot: ->
    item = @readShort()

    if item is -1
      'empty'
    else
      count = @readByte()
      damage = @readShort()

      # TODO Skips over NBT data
      if item in Protocol.ENCHANTABLES
        bytes = @readShort()
        assert(@idx + bytes < @buf.length, 'slot out of range')
        @idx += bytes

      {item: item, count: count, damage: damage}

  readSlots: ->
    length = @readShort()
    # Short circuit early
    assert(length <= @buf.length)

    @readSlot() for i in [0...length]

  # TODO Include Buffer of Gzip'd NBT data
  readChunk: ->
    bytes = @readInt()

    # Explicit bounds check as data isn't actually read
    assert(@idx + bytes < @buf.length, 'chunk out of range')

    @idx += bytes
    ['chunk', bytes]

  readBlockChanges: ->
    length = @readShort()
    coords = for i in [0...length]
      @readShort()

    types = for i in [0...length]
      @readByte()

    metadata = for i in [0...length]
      @readByte()

    [coords, types, metadata]


  readRecord: ->
    length = @readInt()
    for i in [0...length]
      [@readByte(), @readByte(), @readByte()]

  readText: ->
    length = @readByte()
    text = @buf.toString('ascii', @idx, @idx+length)
    @idx += length
    text


  rewind: ->
    @idx = 0

  parse: (@buf) ->
    header = @readByte()
    schema = Protocol.SCHEMAS[header]

    unless schema?
      console.log header
      console.log schema
      console.log @buf
      process.exit(1)

    payload = for fieldType in schema
      @["read#{fieldType}"]()

    bytesRead = @idx
    @idx = 0

    [bytesRead, header, payload]
