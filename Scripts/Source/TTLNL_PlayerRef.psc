Scriptname TTLNL_PlayerRef extends ReferenceAlias

Event OnPlayerLoadGame()
    TTLNL_MainController mainController = self.GetOwningQuest() as TTLNL_MainController
    mainController.Maintenance()
EndEvent

