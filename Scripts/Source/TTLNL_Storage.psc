Scriptname TTLNL_Storage

Function UpdateNpcSexualData(Actor npc) global
    int solo = TTLL_Store.GetNpcInt(npc, "solosex")
    StorageUtil.SetIntValue(npc, "TTLNLDec_SexualData_SoloSex", solo)

    int exclusive = TTLL_Store.GetNpcInt(npc, "exclusivesex")
    StorageUtil.SetIntValue(npc, "TTLNLDec_SexualData_ExclusiveSex", exclusive)

    int groupCount = TTLL_Store.GetNpcInt(npc, "groupsex")
    StorageUtil.SetIntValue(npc, "TTLNLDec_SexualData_GroupSex", groupCount)

    int sameSexEncounter = TTLL_Store.GetNpcInt(npc, "samesexencounter")
    StorageUtil.SetIntValue(npc, "TTLNLDec_SexualData_SameSexEncounter", sameSexEncounter)
EndFunction

Function UpdateNpcLoverSexualData(Actor npc, Actor lover) global
    StorageUtil.FormListAdd(npc, "TTLNLDec_SexualData_Lovers", lover, false)
    string recency = "never"
    int daysAgo = (Utility.GetCurrentGameTime() - TTLL_Store.GetLoverFlt(npc, lover, "lasttime")) as int
    if(daysAgo <= 1)
        recency = "today"
    elseif(daysAgo <= 7)
        recency = daysAgo + " days ago"
    elseif(daysAgo < 30.0)
        recency = ((daysAgo / 7) as int) + " weeks ago"
    elseif(daysAgo <= 365)
        recency = ((daysAgo / 30) as int) + " months ago"
    else
        recency = "over a year ago"
    endif
    StorageUtil.SetStringValue(npc, "TTLNLDec_Lover_" + lover.GetFormID() + "_recency", recency)

    float score = TTLL_Store.GetLoverScore(npc, lover)
    string bondLevel = "weak"
    if(score > 40)
        bondLevel = "deep bond"
    elseif(score > 20)
        bondLevel = "strong connection"
    elseif(score > 10)
        bondLevel = "established relationship"
    elseif(score > 5)
        bondLevel = "casual connection"
    endif
    StorageUtil.SetFloatValue(npc, "TTLNLDec_Lover_" + lover.GetFormID() + "_Bond", TTLL_Store.GetLoverScore(npc, lover))

    int exclusive = TTLL_Store.GetLoverInt(npc, lover, "exclusivesex")
    int group = TTLL_Store.GetLoverInt(npc, lover, "groupsex")
    StorageUtil.SetIntValue(npc, "TTLNLDec_Lover_" + lover.GetFormID() + "_Exclusive", exclusive)
    StorageUtil.SetIntValue(npc, "TTLNLDec_Lover_" + lover.GetFormID() + "_Group", group)
EndFunction



