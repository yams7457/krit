
   
   modes = nest_ {
   track = _grid.number {
      x = {1, 4},
      y = 8,
      level = {4, 15},
      
        enabled = function(self)
                return (seq.meta.value == 1)
            end
   }
  
}
