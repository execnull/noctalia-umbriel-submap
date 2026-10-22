local available =
    noctalia.getenv("UMBRIEL_SOCKET") ~= nil
    and noctalia.commandExists("umbriel")

if not available then
    barWidget.setVisible(false)
    return
end

local alwaysVisible = noctalia.getConfig("always_visible") == true
local showGlyph = noctalia.getConfig("show_glyph") == true

barWidget.setVisible(alwaysVisible)
if showGlyph then
    barWidget.setGlyph(noctalia.getConfig("glyph"))
end

local function submapLabel(submap)
  if type(submap) == "string" and submap ~= "" then
    return submap
  end
  return noctalia.tr("default")
end


local function onEvent(line)
    local event = noctalia.json.decode(line)

    if type(event) ~= "table" or event.event ~= "submap" then
        return
    end

    local submap = event.data
    barWidget.setText(submapLabel(submap))
    barWidget.setVisible(alwaysVisible or submap ~= nil)
end

noctalia.runStream("umbriel subscribe submap", onEvent)
