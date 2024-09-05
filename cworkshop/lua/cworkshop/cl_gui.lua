function CreateCWorkshopGui()
    local Root = vgui.Create("DFrame")
    Root:SetSize(ScreenScale(150), ScreenScale(200))
    Root:Center()
    Root:MakePopup()
    Root:SetTitle("CWorkshop - Dynamic Workshop Loader")

    local Sheet = vgui.Create("DPropertySheet", Root)
    Sheet:Dock(FILL)

    local InformationPanel = vgui.Create("DPanel", Sheet)
    local InformationHTML = vgui.Create("HTML", InformationPanel)
    InformationHTML:Dock(FILL)
    InformationHTML:OpenURL("https://cirroskais.github.io/cworkshop-html/information.html?"..math.random(9999999,1111111))
    Sheet:AddSheet("Information", InformationPanel, "icon16/information.png")

    local ManagePanel = vgui.Create("DPanel", Sheet)
    Sheet:AddSheet("Addons", ManagePanel, "icon16/package.png")

    local SettingsPanel = vgui.Create("DPanel", Sheet)
    Sheet:AddSheet("Settings", SettingsPanel, "icon16/cog.png")
end