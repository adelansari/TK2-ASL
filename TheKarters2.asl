state("TheKarters2")
{
    // Primary Timer Path (Instruction: movss [rax+2C], xmm6)
    float raceTimer   : "GameAssembly.dll", 0x042308D0, 0xB8, 0x2C;

    // New Race Status Flag (Instruction: mov [rax+29], cl)
    // 1 = Racing, 0 = Race Over / Menus
    byte raceActive   : "GameAssembly.dll", 0x042308D0, 0xB8, 0x29;
}

init
{
    refreshRate = 60;
}

start
{
    // Starts perfectly when the countdown hits "GO!" and the timer starts climbing
    if (current.raceTimer > 0.0 && old.raceTimer == 0.0)
    {
        return true;
    }
}

split
{
    // Splits the exact frame the game registers the race as finished (dropping from 1 to 0).
    // The timer check ensures it won't accidentally trigger a split if you manually reset to the main menu.
    if (old.raceActive == 1 && current.raceActive == 0 && current.raceTimer > 0.0)
    {
        return true;
    }
}

isLoading
{
    // Pauses LiveSplit whenever you hit the pause menu or are stuck in a loading screen.
    return current.raceTimer == old.raceTimer || current.raceTimer == 0.0;
}