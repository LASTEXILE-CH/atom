local BaseGameMode = BaseClass("BaseGameMode")

local function InitGameMode(self)
	print("InitGameMode ".."BaseGameMode")
	self.WorkPlayerList = ViRefList2.New()
	self.WatchPlayerList = ViRefList2.New()
	self.HeroList = ViRefList2.New()
	self.ControllerList = ViRefList2.New()
	self.ObjectList = ViRefList2.New()
	self.LastTick0Time = GameRules:GetDOTATime(false, true)
	self.LastTick1Time = GameRules:GetDOTATime(false, true)

	self.Tick0Node = ViTimeNode1.New()
	local dele0 = ViDelegate1.New()
	dele0:SetDele(self.OnTick0)
	--
	self.Tick1Node = ViTimeNode1.New()
	local dele1 = ViDelegate1.New()
	dele0:SetDele(self.OnTick1)
end

local function OnTick0(self)
	
end

local function OnTick1(self)
	
end

local function _OnTick0(self)
	
end

local function _OnTick1(self)
	
end

local function EndGame(self)
	print("EndGame ".."BaseGameMode")
end

local function OnPlayerEnter(self, player)
	print("OnPlayerEnter ".."BaseGameMode")
	player:GetRefController():Attach(GameKeyWord.GameSpace, self.WorkPlayerList)
end

local function OnPlayerExit(self, player)
	print("OnPlayerExit ".."BaseGameMode")
	player:GetRefController():Detach(GameKeyWord.GameSpace)
end

local function OnHeroEnter(self, hero)
	print("OnHeroEnter ".."BaseGameMode")
end

local function OnHeroExit(self, hero)
	print("OnHeroExit ".."BaseGameMode")
end

BaseGameMode.__init = InitGameMode
BaseGameMode.__delete = EndGame
BaseGameMode.OnTick0 = OnTick0
BaseGameMode.OnTick1 = OnTick1

BaseGameMode.OnPlayerEnter = OnPlayerEnter
BaseGameMode.OnPlayerExit = OnPlayerExit
BaseGameMode.OnHeroEnter = OnHeroEnter
BaseGameMode.OnHeroExit = OnHeroExit

BaseGameMode.TICK0_TIME = 0.03
BaseGameMode.TICK1_TIME = 0.3

BaseGameMode.OnTick0 = OnTick0
BaseGameMode.OnTick1 = OnTick1

BaseGameMode._OnTick0 = _OnTick0
BaseGameMode._OnTick1 = _OnTick1

return BaseGameMode