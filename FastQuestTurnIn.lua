local a_name, a_env = ...
if not a_env.load_this then return end

local function UniqSlashID(base, maxNumber)
	local clear=true
	for idx=1, maxNumber do
		if(_G["SLASH_"..base..idx]) then clear=false break end
	end
	if(SlashCmdList[base]) then clear=false end
	if(clear) then return base end
	return UniqSlashID(base..(string.char(random(string.byte('a'), string.byte('z')))), maxNumber)
end

local strmatch=strmatch
local tonumber=tonumber
local strlower=strlower
local strupper=strupper
local SetBinding=SetBinding
local InterractNotHooked=1

local selectQuest, selectReward
local function InterractUnitHook()
	if selectQuest then
		local quests = C_GossipInfo.GetAvailableQuests()
		local quest_id = quests and quests[selectQuest] and quests[selectQuest].questID
		if quest_id then
			C_GossipInfo.SelectAvailableQuest(quest_id)
		end
		CompleteQuest()
		GetQuestReward(selectReward)
	end
end

local function FastQuestTurnInSlash(command)
	local key, quest, reward, remain
	key, remain=strmatch(command, "^%s*(%S+)%s*(.*)")
	if(not key) then
		DEFAULT_CHAT_FRAME:AddMessage("Usage: /fq Key QuestNumber RewardNumber\nQuestNumber and RewardNumber specify which quest in NPC list you want to complete and what optional reward to choose.\nYou only need to specify a key to bind and numbers will default to first quest and reward if you don't set them.")
	else
		if(strlower(key)=="off") then
			DEFAULT_CHAT_FRAME:AddMessage('Turning quest submission off. Key will remain bound to "interract with target" action.')
			selectQuest=nil
		else
			key=strupper(key)
			quest, remain=strmatch(remain, "^%s*(%d+)%s*(.*)")
			if(quest) then
				quest=tonumber(quest)
				reward=strmatch(remain, "^%s*(%d+)")
				if(reward) then reward=tonumber(reward) else reward=1 end
			else
				quest=1 reward=1
			end
			print("Binding to "..key..". Quest #"..quest..", reward #"..reward..".\nUse /fq off to turn off quest submission.")
			SetBinding(key, "INTERACTTARGET")
			if(InterractNotHooked) then
				hooksecurefunc(C_PlayerInteractionManager, "InteractUnit", InterractUnitHook)
				InterractNotHooked=nil
				InterractUnitHook=nil
			end
			selectQuest=quest
			selectReward=reward
		end
	end
end

local slashID=UniqSlashID("FastQuestTurnIn", 1)
_G["SLASH_"..slashID.."1"]="/fq"
SlashCmdList[slashID]=FastQuestTurnInSlash

UniqSlashID=nil
FastQuestTurnInSlash=nil