ready = ()->
  if $('.freeow').length > 0
    opts = {}
    opts.classes = ["smokey"]
    opts.classes.push("error")
    opts.autoHide = true
    opts.classes.push("slide")
    opts.hideStyle = {
      opacity: 0,
      left: "400px"
    };
    opts.showStyle = {
      opacity: 1,
      left: 0
    };
    
    container = $('#freeow-tr')
    $(container).freeow('Error',$('input.sync').val(), opts)

$(document).ready(ready)
$(document).load(ready)