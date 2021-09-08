include 'lib/nest/core'
include 'lib/nest/norns'
include 'lib/nest/grid'

g = grid.connect()

seq = nest_ {
    track = _grid.number {
        x = { 1, 4 },
        y = 8,
        level = { 4, 15 },
         enabled = function(self)
                return (seq.meta.value == 1)
            end
    },
  
      tab = _grid.number {
        x = { 6, 9 },
        y = 8,
        level = { 4, 15 },
         enabled = function(self)
                return (seq.meta.value == 1)
            end
    },
      
      loop = _grid.momentary {
        x = { 11},
        y = 8,
        level = {4, 15},
        
        enabled = function(self)
                return (seq.meta.value == 1)
            end
        
      },

      timez = _grid.momentary {
        x = { 12},
        y = 8,
        level = {4, 15},
        
        enabled = function(self)
                return (seq.meta.value == 1)
            end
        
      },
      
      probability = _grid.momentary {
        x = { 13 },
        y = 8,
        level = { 4, 15},
        
        enabled = function(self)
                return (seq.meta.value == 1)
            end
      },
      
      meta = _grid.number {
          x = { 15, 16},
          y = 8,
          level = {4, 15}
          
      },

      t1gsl = _grid.range {
          x = { 1, 16},
          y = 1,
          level = {0, 2},
          enabled = function(self)
                return (seq.tab.value == 1 and seq.meta.value == 1 and seq.loop.value == 1)
            end
      },
          t2gsl = _grid.range {
          x = { 1, 16},
          y = 2,
          level = {0, 2},
          enabled = function(self)
                return (seq.tab.value == 1 and seq.meta.value == 1)
            end
      },
          t3gsl = _grid.range {
          x = { 1, 16},
          y = 3,
          level = {0, 2},
          enabled = function(self)
                return (seq.tab.value == 1 and seq.meta.value == 1)
            end
      },
          t4gsl = _grid.range {
          x = { 1, 16},
          y = 4,
          level = {0, 2},
          enabled = function(self)
              return (seq.tab.value == 1 and seq.meta.value == 1)
          end
      },
    gatefield = _grid.toggle {
        x = { 1, 16},
        y = { 1, 4},
        level = { 0, 15 },
          enabled = function(self)
            return (seq.tab.value == 1 and seq.meta.value == 1 and seq.loop.value == 0)
          end
    }
}



seq:connect { g = grid.connect() }
function init() seq:init() end
