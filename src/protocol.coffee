exports.LABELS =
  0x00: 'keepalive'
  0x01: 'login'
  0x02: 'handshake'
  0x03: 'chat'
  0x04: 'time update'
  0x05: 'entity equipment'
  0x06: 'spawn position'
  0x07: 'use entity'
  0x08: 'update health'
  0x09: 'respawn'
  0x0A: 'player'
  0x0B: 'player position'
  0x0C: 'player look'
  0x0D: 'player position and look'
  0x0E: 'player digging'
  0x0F: 'player block placement'
  0x10: 'holding change'
  0x11: 'use bed'
  0x12: 'animation'
  0x13: 'entity action'
  0x14: 'named entity spawn'
  0x15: 'pickup spawn'
  0x16: 'collect item'
  0x17: 'add object'
  0x18: 'mob spawn'
  0x19: 'painting'
  0x1A: 'experience orb'
  0x1B: 'stance'
  0x1C: 'entity velocity'
  0x1D: 'destroy entity'
  0x1E: 'entity'
  0x1F: 'entity move'
  0x20: 'entity look'
  0x21: 'entity look and move'
  0x22: 'entity teleport'
  0x26: 'entity status'
  0x27: 'attach entity'
  0x28: 'entity metadata'
  0x29: 'entity effect'
  0x2A: 'remove entity effect'
  0x2B: 'experience'
  0x32: 'pre-chunk'
  0x33: 'map chunk'
  0x34: 'multi block change'
  0x35: 'block change'
  0x36: 'block action'
  0x3C: 'explosion'
  0x3D: 'effect'
  0x46: 'clear state'
  0x47: 'thunderbolt'
  0x64: 'open window'
  0x65: 'close window'
  0x66: 'window click'
  0x67: 'set slot'
  0x68: 'window items'
  0x69: 'update window property'
  0x6A: 'transaction'
  0x6B: 'inventory action'
  0x6C: 'enchant item'
  0x82: 'update sign'
  0x83: 'item data'
  0xC8: 'increment stat'
  0xC9: 'player list item'
  0xFE: 'ping'
  0xFF: 'kick'

exports.SCHEMAS =
  0x00: ['Int']
  0x01: ['Int', 'Str', 'Long', 'Int', 'Byte', 'Byte', 'Byte', 'Byte']
  0x02: ['Str']
  0x03: ['Str']
  0x04: ['Long']
  0x05: ['Int', 'Short', 'Short', 'Short']
  0x06: ['Int', 'Int', 'Int']
  0x07: ['Int', 'Int', 'Bool']
  0x08: ['Short', 'Short', 'Float']
  0x09: ['Byte', 'Byte', 'Byte', 'Short', 'Long']
  0x0A: ['Bool']
  0x0B: ['Double', 'Double', 'Double', 'Double', 'Bool']
  0x0C: ['Float', 'Float', 'Bool']
  0x0D: ['Double', 'Double', 'Double', 'Double', 'Float', 'Float', 'Bool']
  0x0E: ['Byte', 'Int', 'Byte', 'Int', 'Byte']
  0x0F: ['Int', 'Byte', 'Int', 'Byte', 'Slot']
  0x10: ['Short']
  0x11: ['Int', 'Byte', 'Int', 'Byte', 'Int']
  0x12: ['Int', 'Byte']
  0x13: ['Int', 'Byte']
  0x14: ['Int', 'Str', 'Int', 'Int', 'Int', 'Byte', 'Byte', 'Short']
  0x15: ['Int', 'Short', 'Byte', 'Short', 'Int', 'Int', 'Int', 'Byte', 'Byte', 'Byte']
  0x16: ['Int', 'Int']
  0x17: ['Int', 'Byte', 'Int', 'Int', 'Int', 'Int', 'Short', 'Short', 'Short']
  0x18: ['Int', 'Byte', 'Int', 'Int', 'Int', 'Byte', 'Byte', 'Metadata']
  0x19: ['Int', 'Str', 'Int', 'Int', 'Int', 'Int']
  0x1A: ['Int', 'Int', 'Int', 'Int', 'Short']
  0x1B: ['Float', 'Float', 'Float', 'Float', 'Bool', 'Bool']
  0x1C: ['Int', 'Short', 'Short', 'Short']
  0x1D: ['Int']
  0x1E: ['Int']
  0x1F: ['Int', 'Byte', 'Byte', 'Byte']
  0x20: ['Int', 'Byte', 'Byte']
  0x21: ['Int', 'Byte', 'Byte', 'Byte', 'Byte', 'Byte']
  0x22: ['Int', 'Int', 'Int', 'Int', 'Byte', 'Byte']
  0x26: ['Int', 'Byte']
  0x27: ['Int', 'Int']
  0x28: ['Int', 'Metadata']
  0x29: ['Int', 'Byte', 'Byte', 'Short']
  0x2A: ['Int', 'Byte']
  0x2B: ['Float', 'Short', 'Short']
  0x32: ['Int', 'Int', 'Bool']
  0x33: ['Int', 'Short', 'Int', 'Byte', 'Byte', 'Byte', 'Chunk']
  0x34: ['Int', 'Int', 'BlockChanges']
  0x35: ['Int', 'Byte', 'Int', 'Byte', 'Byte']
  0x36: ['Int', 'Short', 'Int', 'Byte', 'Byte']
  0x3C: ['Double', 'Double', 'Double', 'Float', 'Record']
  # Parsing of this could be more useful
  0x3D: ['Int', 'Int', 'Byte', 'Int', 'Int']
  0x46: ['Byte', 'Byte']
  0x47: ['Int', 'Boolean', 'Int', 'Int', 'Int']
  0x64: ['Byte', 'Byte', 'Str', 'Byte']
  0x65: ['Byte']
  # Wiki says right click is byte, should be short.
  0x66: ['Byte', 'Short', 'Bool', 'Short', 'Bool', 'Slot']
  0x67: ['Byte', 'Short', 'Slot']
  0x68: ['Byte', 'Slots']
  0x69: ['Byte', 'Short', 'Short']
  0x6A: ['Byte', 'Short', 'Bool']
  0x6B: ['Short', 'Slot']
  0x6C: ['Byte', 'Byte']
  0x82: ['Int', 'Short', 'Int', 'Str', 'Str', 'Str', 'Str']
  0x83: ['Short', 'Short', 'Text']
  0xC8: ['Int', 'Byte']
  0xC9: ['Str', 'Bool', 'Short']
  0xFE: []
  0xFF: ['Str']

exports.ENCHANTABLES = [
  # Flint, Bow, Rod, Shears
  0x103, 0x105, 0x15A, 0x167,
  # Tools
  0x10C, 0x10D, 0x10E, 0x10F, 0x122,
  0x110, 0x111, 0x112, 0x113, 0x123,
  0x10B, 0x100, 0x101, 0x102, 0x124,
  0x114, 0x115, 0x116, 0x117, 0x125,
  0x11B, 0x11C, 0x11D, 0x11E, 0x126,
  # Armour
  0x12A, 0x12B, 0x12C, 0x12D,
  0x12E, 0x12F, 0x130, 0x131,
  0x132, 0x133, 0x134, 0x135,
  0x136, 0x137, 0x138, 0x139,
  0x13A, 0x13B, 0x13C, 0x13D
]
