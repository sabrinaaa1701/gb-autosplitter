/**
 * Ghostbusters: The Video Game — Unified Autosplitter & Load Remover (v2.14 Final Unified)
 * 
 * Supports:
 *   - Ghostbusters: The Video Game (2009 PC Release)
 *   - Ghostbusters: The Video Game Remastered (Steam)
 *   - Ghostbusters: The Video Game Remastered (Epic Games)
 * 
 * Authors:
 *   - Sabrina (v2.0 Checkpoint System, State Logic & Unification)
 *   - KunoDemetries (Base Memory Offsets & Original Remaster Script)
 * 
 * Community:
 *   - Ghostbusters Speedrunning Community
 */

// Original 2009 (32-bit)
state("ghost_w32")
{
    string50 MapArea          : 0x1718BC0;
    bool Loader               : 0x164C6A0;
    byte LoadingFlag          : 0x1718BAA; // 1 = In-Game, 0 = Loading/Menus (Inverted)
    string64 CheckpointBuffer : 0xB99498;
    string10 Cutscene         : 0x14F2E62; // Active video buffer (gb12)
}

state("ghost")
{
    string50 MapArea          : 0x1718BC0;
    bool Loader               : 0x164C6A0;
    byte LoadingFlag          : 0x1718BAA;
    string64 CheckpointBuffer : 0xB99498;
    string10 Cutscene         : 0x14F2E62;
}

// Remastered: Steam (64-bit)
state("ghost", "Steam")
{
    string50 MapArea          : 0x205E058;
    bool Loader               : 0xDD3A40;
    byte LoadingFlag          : 0xDD3A40;
    string64 CheckpointBuffer : 0x1671800;
    string10 Cutscene         : 0x2098BE2; // Active video filename buffer (Steam)
}

// Remastered: Epic Games (64-bit)
state("ghost", "Epic")
{
    string50 MapArea          : 0x1FB5DF8;
    bool Loader               : 0xD2FA30;
    byte LoadingFlag          : 0xD2FA30;
    string64 CheckpointBuffer : 0x15C8B30;
    string10 Cutscene         : 0x15C8B50; // Placeholder until dynamic pointer is hooked
}

startup
{
    settings.Add("script_info", true, "Ghostbusters Autosplitter v2.14 by Sabrina & KunoDemetries");

    settings.Add("firehouse_splits", false, "Split on Firehouse Transitions");
    settings.Add("campaign_splits", true, "Split on Checkpoints");

    // Mission 1: Hotel Sedgewick
    settings.Add("sedgewick", true, "Mission 1: Hotel Sedgewick", "campaign_splits");
    settings.Add("You're Hired", true, "2.1: You're Hired", "sedgewick");
    settings.Add("Extended Service Agreement", true, "2.2: Extended Service Agreement", "sedgewick");
    settings.Add("On-The-Job-Training", true, "2.3: On-The-Job-Training", "sedgewick");
    settings.Add("Slime Trail", true, "2.4: Slime Trail", "sedgewick");
    settings.Add("Rough Descent", true, "2.5: Rough Descent", "sedgewick");
    settings.Add("Bad Service", true, "2.6: Bad Service", "sedgewick");
    settings.Add("Air in the Lines", true, "2.7: Air in the Lines", "sedgewick");
    settings.Add("Rodriguez Bar Mitzvah", true, "2.8: Rodriguez Bar Mitzvah", "sedgewick");
    settings.Add("The Bellhops Are Restless", true, "2.9: The Bellhops Are Restless", "sedgewick");
    settings.Add("Charge of the Light Brigade", true, "2.10: Charge of the Light Brigade", "sedgewick");
    settings.Add("Sargassi's by the Sea", true, "2.11: Sargassi's by the Sea", "sedgewick");
    settings.Add("And the Kitchen Sink, Too", true, "2.12: And the Kitchen Sink, Too", "sedgewick");

    // Mission 2: Times Square
    settings.Add("times_square", true, "Mission 2: Times Square", "campaign_splits");
    settings.Add("Mass Panic", true, "2.1: Mass Panic", "times_square");
    settings.Add("Ghosts & Gargoyles", true, "2.2: Ghosts & Gargoyles", "times_square");
    settings.Add("Spin Cycle", true, "2.3: Spin Cycle", "times_square");
    settings.Add("Hindenburg: The Musical", true, "2.4: Hindenburg: The Musical", "times_square");
    settings.Add("Shadow of the Stay Puft", true, "2.5: Shadow of the Stay Puft", "times_square");
    settings.Add("Marshmallow Minis", true, "2.6: Marshmallow Minis", "times_square");
    settings.Add("Race to the Roof", true, "2.7: Race to the Roof", "times_square");
    settings.Add("Puffy White Menace", true, "2.8: Puffy White Menace", "times_square");
    settings.Add("Damsel, Distressed", true, "2.9: Damsel, Distressed", "times_square");
    settings.Add("Ghosts at Work", true, "2.10: Ghosts at Work", "times_square");
    settings.Add("The Rise and Fall of Stay Puft", true, "2.11: The Rise and Fall of Stay Puft", "times_square");

    // Mission 3: Public Library
    settings.Add("library", true, "Mission 3: Public Library", "campaign_splits");
    settings.Add("The Man from P.C.O.C.", true, "2.1: The Man from P.C.O.C.", "library");
    settings.Add("One of Our Lions is Missing", true, "2.2: One of Our Lions is Missing", "library");
    settings.Add("Cruster & Crusto", true, "2.3: Cruster & Crusto", "library");
    settings.Add("Dangerous Books", true, "2.4: Dangerous Books", "library");
    settings.Add("There She Is!", true, "2.5: There She Is!", "library");
    settings.Add("Ssshhed Again", true, "2.6: Ssshhed Again", "library");
    settings.Add("Scary Stories", true, "2.7: Scary Stories", "library");
    settings.Add("Sorted Out", true, "2.8: Sorted Out", "library");
    settings.Add("Slippery", true, "2.9: Slippery", "library");
    settings.Add("Hey! Look Behind You!", true, "2.10: Hey! Look Behind You!", "library");
    settings.Add("Story Hour", true, "2.11: Story Hour", "library");
    settings.Add("Special Collections", true, "2.12: Special Collections", "library");
    settings.Add("Old Secret Places", true, "2.13: Old Secret Places", "library");
    settings.Add("Dark & Damp", true, "2.14: Dark & Damp", "library");
    settings.Add("The Trouble with Golems", true, "2.15: The Trouble with Golems", "library");
    settings.Add("The Gozerian Codex", true, "2.16: The Gozerian Codex", "library");
    settings.Add("Eleanor's Plan", true, "2.17: Eleanor's Plan", "library");
    settings.Add("The Other Side", true, "2.18: The Other Side", "library");
    settings.Add("Across the Bridge", true, "2.19: Across the Bridge", "library");
    settings.Add("Hall of Mirrors", true, "2.20: Hall of Mirrors", "library");
    settings.Add("Curiouser & Curiouser", true, "2.21: Curiouser & Curiouser", "library");
    settings.Add("Ghostworld Library", true, "2.22: Ghostworld Library", "library");
    settings.Add("Topsy Turvy", true, "2.23: Topsy Turvy", "library");
    settings.Add("The Long Staircase", true, "2.24: The Long Staircase", "library");
    settings.Add("Wrath of the Collector", true, "2.25: Wrath of the Collector", "library");

    // Mission 4: Museum of Natural History
    settings.Add("museum", true, "Mission 4: Museum of Natural History", "campaign_splits");
    settings.Add("The Shandor Legacy", true, "2.1: The Shandor Legacy", "museum");
    settings.Add("Dr. Rutherford, I Presume?", true, "2.2: Dr. Rutherford, I Presume?", "museum");
    settings.Add("Opening Night", true, "2.3: Opening Night", "museum");
    settings.Add("Ilyssa Lost", true, "2.4: Ilyssa Lost", "museum");
    settings.Add("Chairman Chase", true, "2.5: Chairman Chase", "museum");
    settings.Add("Ruined Hallway", true, "2.6: Ruined Hallway", "museum");
    settings.Add("American History", true, "2.7: American History", "museum");
    settings.Add("Ghost War", true, "2.8: Ghost War", "museum");
    settings.Add("Little Egypt", true, "2.9: Little Egypt", "museum");
    settings.Add("Unexpected Guests", true, "2.10: Unexpected Guests", "museum");
    settings.Add("The Ossuary", true, "2.11: The Ossuary", "museum");
    settings.Add("Board of Trustees", true, "2.12: Board of Trustees", "museum");
    settings.Add("Deep, Dark & Spooky", true, "2.13: Deep, Dark & Spooky", "museum");
    settings.Add("It's the Chairman", true, "2.14: It's the Chairman", "museum");

    // Mission 5: Return to Hotel Sedgewick
    settings.Add("return_sedgewick", true, "Mission 5: Return to Hotel Sedgewick", "campaign_splits");
    settings.Add("Mandala Revealed", true, "3.1: Mandala Revealed", "return_sedgewick");
    settings.Add("Access Denied", true, "3.2: Access Denied", "return_sedgewick");
    settings.Add("Endless Party", true, "3.3: Endless Party", "return_sedgewick");
    settings.Add("Enter the Spiderwitch", true, "3.4: Enter the Spiderwitch", "return_sedgewick");
    settings.Add("The Kitchen", true, "3.5: The Kitchen", "return_sedgewick");
    settings.Add("Emergency Generator", true, "3.6: Emergency Generator", "return_sedgewick");
    settings.Add("Power Restored", true, "3.7: Power Restored", "return_sedgewick");
    settings.Add("Splitting Up", true, "3.8: Splitting Up", "return_sedgewick");
    settings.Add("Up to the 12th", true, "3.9: Up to the 12th", "return_sedgewick");
    settings.Add("The 12th Floor?", true, "3.10: The 12th Floor?", "return_sedgewick");
    settings.Add("Ghostworld Again", true, "3.11: Ghostworld Again", "return_sedgewick");
    settings.Add("The 13th Floor", true, "3.12: The 13th Floor", "return_sedgewick");
    settings.Add("Lair of the Spiderwitch", true, "3.13: Lair of the Spiderwitch", "return_sedgewick");

    // Mission 6: Lost Island
    settings.Add("lost_island", true, "Mission 6: Lost Island", "campaign_splits");
    settings.Add("The Old Docks", true, "2.1: The Old Docks", "lost_island");
    settings.Add("Long Climb", true, "2.2: Long Climb", "lost_island");
    settings.Add("Million-Dollar View", true, "2.3: Million-Dollar View", "lost_island");
    settings.Add("On the Ramparts", true, "2.4: On the Ramparts", "lost_island");
    settings.Add("The Hedge Maze", true, "2.5: The Hedge Maze", "lost_island");
    settings.Add("Gaining Entrance", true, "2.6: Gaining Entrance", "lost_island");
    settings.Add("Black Mass", true, "2.7: Black Mass", "lost_island");
    settings.Add("Gozer Worshippers", true, "2.8: Gozer Worshippers", "lost_island");
    settings.Add("Rescue Mission", true, "2.9: Rescue Mission", "lost_island");
    settings.Add("Rivers of Slime", true, "2.10: Rivers of Slime", "lost_island");
    settings.Add("Black Slime What!?", true, "2.11: Black Slime What!?", "lost_island");
    settings.Add("Sewer Maze", true, "2.12: Sewer Maze", "lost_island");
    settings.Add("The Slime Labs", true, "2.13: The Slime Labs", "lost_island");
    settings.Add("Rescue Egon", true, "2.14: Rescue Egon", "lost_island");
    settings.Add("Black Slime Beast", true, "2.15: Black Slime Beast", "lost_island");

    // Mission 7: Central Park Cemetery
    settings.Add("cemetery", true, "Mission 7: Central Park Cemetery", "campaign_splits");
    settings.Add("Hero's Welcome", true, "2.1: Hero's Welcome", "cemetery");
    settings.Add("Outside the Gates", true, "2.2: Outside the Gates", "cemetery");
    settings.Add("Stone Gardens", true, "2.3: Stone Gardens", "cemetery");
    settings.Add("The Elusive Key", true, "2.4: The Elusive Key", "cemetery");
    settings.Add("Battle in the Boneyard", true, "2.5: Battle in the Boneyard", "cemetery");
    settings.Add("Crypt Alley", true, "2.6: Crypt Alley", "cemetery");
    settings.Add("Chance for Rain", true, "2.7: Chance for Rain", "cemetery");
    settings.Add("Airstrike", true, "2.8: Airstrike", "cemetery");
    settings.Add("Full Assault", true, "2.9: Full Assault", "cemetery");
    settings.Add("Together Again", true, "2.10: Together Again", "cemetery");
    settings.Add("Underground", true, "2.11: Underground", "cemetery");
    settings.Add("Surfacing", true, "2.12: Surfacing", "cemetery");
    settings.Add("Attack of the Stone Angels", true, "2.13: Attack of the Stone Angels", "cemetery");
    settings.Add("The Final Gate", true, "2.14: The Final Gate", "cemetery");
    settings.Add("Shandor Mausoleum", true, "2.15: Shandor Mausoleum", "cemetery");
    settings.Add("Headstones", true, "2.16: Headstones", "cemetery");
    settings.Add("Destructor Form", true, "2.17: Destructor Form", "cemetery");
    settings.Add("Cross the Streams!", true, "2.18: Cross the Streams! (Arena Entry)", "cemetery");

    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {
        DialogResult prompt = MessageBox.Show(
            "Ghostbusters: The Video Game leaderboard submissions require Game Time (Time without Loads).\n\n" +
            "Switch comparison timing method to Game Time automatically?",
            "LiveSplit AutoSplitter Setup",
            MessageBoxButtons.YesNo,
            MessageBoxIcon.Information
        );

        if (prompt == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

init
{
    vars.TimerModel = new TimerModel { CurrentState = timer };
    vars.CompletedCheckpoints = new HashSet<string>();

    const int EpicBytes  = 51519488;
    const int SteamBytes = 52211712;

    var mainModule = modules.First();
    int moduleSize = mainModule.ModuleMemorySize;

    if (moduleSize == EpicBytes)
    {
        version = "Epic";
        vars.IsRemaster = true;
    }
    else if (moduleSize == SteamBytes)
    {
        version = "Steam";
        vars.IsRemaster = true;
    }
    else
    {
        version = "2009 Fixed Edition";
        vars.IsRemaster = false;
    }
}

start
{
    bool isRemaster     = (bool)vars.IsRemaster;
    byte currentLoading = (byte)current.LoadingFlag;
    byte oldLoading     = (byte)old.LoadingFlag;
    string currentMap   = (string)current.MapArea;

    bool inGameNow = isRemaster ? (currentLoading == 0) : (currentLoading == 1);
    bool wasInGame = isRemaster ? (oldLoading == 0)     : (oldLoading == 1);

    return (string.Equals(currentMap, "firehouse", StringComparison.OrdinalIgnoreCase) && inGameNow && !wasInGame);
}

onStart
{
    vars.CompletedCheckpoints.Clear();

    if (!string.IsNullOrEmpty((string)current.CheckpointBuffer))
    {
        vars.CompletedCheckpoints.Add(((string)current.CheckpointBuffer).Trim());
    }
}

split
{
    if (timer.CurrentTime.RealTime.HasValue && timer.CurrentTime.RealTime.Value.TotalSeconds < 1.0)
    {
        return false;
    }

    bool isRemaster        = (bool)vars.IsRemaster;
    byte currentLoading    = (byte)current.LoadingFlag;
    string currentMap      = (string)current.MapArea;
    string oldMap          = (string)old.MapArea;
    string currentCutscene = (string)current.Cutscene;
    string oldCutscene     = (string)old.Cutscene;

    bool inGameNow = isRemaster ? (currentLoading == 0) : (currentLoading == 1);
    HashSet<string> completed = (HashSet<string>)vars.CompletedCheckpoints;

    // Final Split: Shandor Defeat / gb12 Cutscene Trigger
    if (!completed.Contains("ShandorDefeated"))
    {
        string cs = !string.IsNullOrEmpty(currentCutscene) ? currentCutscene.Trim() : "";
        string oldCs = !string.IsNullOrEmpty(oldCutscene) ? oldCutscene.Trim() : "";

        if (cs.IndexOf("gb12", StringComparison.OrdinalIgnoreCase) >= 0 &&
            oldCs.IndexOf("gb12", StringComparison.OrdinalIgnoreCase) < 0)
        {
            completed.Add("ShandorDefeated");
            return true;
        }
    }

    // Optional firehouse return split
    if (settings.ContainsKey("firehouse_splits") && settings["firehouse_splits"] && 
        inGameNow && 
        string.Equals(currentMap, "firehouse", StringComparison.OrdinalIgnoreCase) && 
        !string.Equals(oldMap, "firehouse", StringComparison.OrdinalIgnoreCase))
    {
        return true;
    }

    // Checkpoint split evaluation
    string currentCpRaw = (string)current.CheckpointBuffer;
    string oldCpRaw     = (string)old.CheckpointBuffer;

    if (currentCpRaw != oldCpRaw && !string.IsNullOrEmpty(currentCpRaw))
    {
        string cp = currentCpRaw.Trim();

        // FAILSAFE 1: Ghostworld Staircase Skip / Dialogue Delay
        if (cp == "Wrath of the Collector" && !completed.Contains("The Long Staircase"))
        {
            if (settings.ContainsKey("The Long Staircase") && settings["The Long Staircase"])
            {
                completed.Add("The Long Staircase");
                vars.TimerModel.SkipSplit();
            }

            completed.Add("Wrath of the Collector");
            return (settings.ContainsKey("Wrath of the Collector") && settings["Wrath of the Collector"]);
        }

        // FAILSAFE 2: Cruster Skip
        if (cp == "Slippery" && !completed.Contains("Sorted Out"))
        {
            if (settings.ContainsKey("Sorted Out") && settings["Sorted Out"])
            {
                completed.Add("Sorted Out");
                vars.TimerModel.SkipSplit();
            }

            completed.Add("Slippery");
            return (settings.ContainsKey("Slippery") && settings["Slippery"]);
        }

        bool isNew = completed.Add(cp);

        if (settings.ContainsKey(cp) && settings[cp])
        {
            return isNew;
        }
    }

    return false;
}

isLoading
{
    bool isRemaster = (bool)vars.IsRemaster;
    byte loading    = (byte)current.LoadingFlag;

    return isRemaster ? (loading != 0) : (loading == 0);
}

reset
{
    return false;
}

onReset
{
    vars.CompletedCheckpoints.Clear();
}
