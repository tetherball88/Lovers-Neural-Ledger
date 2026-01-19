Scriptname TTLNL_MainController extends Quest

Event OnInit()
    Maintenance()
EndEvent

Function Maintenance()
    RegisterForModEvent("ttll_thread_data_event", "ThreadFinished")
EndFunction

Event ThreadFinished(int ThreadID)
    Actor[] actors = TTLL_ThreadsCollector.GetActors(ThreadID)
    int i = 0
    while(i < actors.Length)
        Actor current = actors[i]
        TTLNL_Storage.UpdateNpcSexualData(current)

        Actor[] lovers = TTLL_Store.GetAllLovers(current)
        int j = 0
        while(j < lovers.Length)
            TTLNL_Storage.UpdateNpcLoverSexualData(current, lovers[j])
            j += 1
        endwhile
        i += 1
    endwhile
EndEvent
