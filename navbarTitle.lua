navbarTitle = navbarTitle or {
  triggers = {},
  state = {}
}

function navbarTitle:print_guard(_guard_state)
  local gstates = {}
  gstates[5]    = "[-----]"
  gstates[4]    = "[#----]"
  gstates[3]    = "[##---]"
  gstates[2]    = "[###--]"
  gstates[1]    = "[####-]"
  gstates["ok"] = "[#####]"
  
  return gstates[_guard_state]
end


function navbarTitle:print_order(_order_state)
  if _order_state == false then
    return "[#####]"
  end
  
  local gstates = {}
  gstates[15]    = "[-----]"
  gstates[14]    = "[-----]"
  gstates[13]    = "[-----]"
  gstates[12]    = "[#----]"
  gstates[11]    = "[#----]"
  gstates[10]    = "[#----]"
  gstates[9]    = "[##---]"
  gstates[8]    = "[##---]"
  gstates[7]    = "[##---]"
  gstates[6]    = "[###--]"
  gstates[5]    = "[###--]"
  gstates[4]    = "[###--]"
  gstates[3]    = "[####-]"
  gstates[2]    = "[####-]"
  gstates[1]    = "[####-]"
  gstates["ok"] = "[#####]"
  
  return gstates[_order_state]
end


function navbarTitle:highlight_state()
  local str_navbartitle = ""
  local str_guard_state = self:print_guard(scripts.ui.states_window_nav_states.guard_state)
  local str_order_state = self:print_order(scripts.ui.states_window_nav_states.order_state)
  str_navbartitle = "ZAS " .. str_guard_state .. " ROZ " .. str_order_state

  setUserWindowTitle(scripts.ui.states_window_name, str_navbartitle)
end


function navbarTitle:clear_state()
  self.state = {}
end

function navbarTitle:init()
  --self.statesHandler = scripts.event_register:register_singleton_event_handler(self.statesHandler, "hidden_state", function() self:highlight_state() end)
  --self.statesHandler = scripts.event_register:register_singleton_event_handler(self.statesHandler, "weapon_state", function() self:highlight_state() end)
  self.statesHandler = scripts.event_register:register_singleton_event_handler(self.statesHandler, "guard_state", function() self:highlight_state() end)
  self.statesHandler = scripts.event_register:register_singleton_event_handler(self.statesHandler, "order_state", function() self:highlight_state() end)
end

navbarTitle:init()
