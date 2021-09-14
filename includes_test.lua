include 'lib/nest/core'
include 'lib/nest/norns'
include 'lib/nest/grid'

g = grid.connect()



seq = nest_ {
    meta = _grid.number {
      x = {15, 16},
      y = 8,
      level = {4, 15}
},
   track = _grid.number {
      x = {1, 4},
      y = 8,
      level = {4, 15}
   },
 
  include 'nest/includes_test_2'
}



seq:connect { g = grid.connect() }
function init() seq:init() end
