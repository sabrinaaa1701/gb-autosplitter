state("ghost_w32")
{
    string50 CurrentMapArea : 0x1718BC0;
    byte IsInGame           : 0x1718BAA; // 0 = Loading / Inactive, 1 = In Game
}

// Fallback if the executable is named ghost.exe
state("ghost")
{
    string50 CurrentMapArea : 0x1718BC0;
    byte IsInGame           : 0x1718BAA;
}

init
{
    vars.doneMaps = new List<string>();
    vars.DoWeSplit = false;
}

startup
{
    settings.Add("FH", false, "Split every time you return to firehouse?");
    settings.Add("GB", true, "All Splits");
    settings.Add("HS", true, "Hotel Sedgewick", "GB");
    settings.Add("TS", true, "Times Square", "GB");
    settings.Add("PL", true, "Public Library", "GB");
    settings.Add("MNH", true, "Museum of Natrual History", "GB");
    settings.Add("RTHS", true, "Return to Hotel Sedgewick", "GB");
    settings.Add("LI", true, "Lost Island", "GB");
    settings.Add("CPC", true, "Central Park Cemetery", "GB");

    var tB = (Func<string, string, string, Tuple<string, string, string>>) ((elmt1, elmt2, elmt3) => { return Tuple.Create(elmt1, elmt2, elmt3); });
    var sB = new List<Tuple<string, string, string>> 
    {
        tB("HS","hotel1a","Slimer"),
        tB("HS","hotel1b","Pappy Sargassi"),
        tB("TS","timesSquare1","Walking with car to Stay Puft"),
        tB("TS","timesSquare1b","Stay Puft fight on street"),
        tB("TS","timesSquare2","Stay Puft fight in building"),
        tB("TS","boss_sp_side","Stay Puft boss fight"),
        tB("PL","Library1a","First section of library"),
        tB("PL","Library1b","Gray Lady underground section"),
        tB("PL","Library2","Gray Lady Boss Fight / Azetlor Boss Fight"),
        tB("MNH","museum1","History Showcase"),
        tB("MNH","museum2","Finding Ilyssa"),
        tB("MNH","museum3","Chairman Fight"),
        tB("RTHS","hotel2","Entering Return to Hotel Sedgewick"),
        tB("RTHS", "13th_floor_boss","Spider Witch Boss Fight"),
        tB("LI","lost_island","Start of Lost Island"),
        tB("LI","lost_island2","Sewers"),
        tB("CPC","cemetary1","Start of Central Park Cemetery"),
        tB("CPC","cemetary2","Crypt Alley"),
        tB("CPC","abyss","Shandor Boss Fight"),
    };
    foreach (var s in sB) settings.Add(s.Item2, true, s.Item3, s.Item1);

    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Ghostbusters The Video Game",
            MessageBoxButtons.YesNo, MessageBoxIcon.Question
        );
        
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

update
{
    // Split on level transition (triggers while loading the new area)
    if (!vars.doneMaps.Contains(current.CurrentMapArea) && settings[current.CurrentMapArea] && (current.IsInGame == 0))
    {
        vars.doneMaps.Add(current.CurrentMapArea);
        vars.DoWeSplit = true;
    }

    // Optional split for returning to the Firehouse (triggers when control is regained)
    if (settings["FH"] && (current.IsInGame == 1) && (current.CurrentMapArea == "firehouse"))
    {
        vars.DoWeSplit = true;
    }
}

start
{
    // Starts when player gains control in the firehouse
    return ((current.CurrentMapArea == "firehouse") && (current.IsInGame == 1));
}

onStart
{
    vars.doneMaps.Clear();
    vars.doneMaps.Add(current.CurrentMapArea);
}

split
{
    if (vars.DoWeSplit)
    {
        vars.DoWeSplit = false;
        return true;
    }
}

isLoading
{
    // Pauses timer whenever IsInGame drops to 0 (loading screens)
    return (current.IsInGame == 0);
}

reset
{
    return (current.CurrentMapArea == null);
}

onReset
{
    vars.doneMaps.Clear();
}