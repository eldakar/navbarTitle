navbarTitle = navbarTitle or {
  triggers = {},
  state = {}
}

function navbarTitle:print_guard(_guard_state)
  local gstates = {}
  gstates[5]    = "[     ]"
  gstates[4]    = "[#    ]"
  gstates[3]    = "[##   ]"
  gstates[2]    = "[###  ]"
  gstates[1]    = "[#### ]"
  gstates["ok"] = "[#####]"
  
  return gstates[_guard_state]
end

function navbarTitle:highlight_state()
  local str_navbartitle = ""
  local str_guard_state = self:navbarTitle(scripts.ui.states_window_nav_states.guard_state)

  str_navbartitle = "ZAS " .. str_guard_state

  setUserWindowTitle(scripts.ui.states_window_name, str_navbartitle)
end


function navbarTitle:clear_state()
  self.state = {}
end

function navbarTitle:init()
  --self.statesHandler = scripts.event_register:register_singleton_event_handler(self.statesHandler, "hidden_state", function() self:highlight_state() end)
  --self.statesHandler = scripts.event_register:register_singleton_event_handler(self.statesHandler, "weapon_state", function() self:highlight_state() end)
  self.statesHandler = scripts.event_register:register_singleton_event_handler(self.statesHandler, "guard_state", function() self:highlight_state() end)
  --self.statesHandler = scripts.event_register:register_singleton_event_handler(self.statesHandler, "order_state", function() self:highlight_state() end)
end

navbarTitle:init()
