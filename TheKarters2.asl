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
    vars.accumulatedTime = 0.0;
}

start
{
    if (current.raceTimer > 0.0 && old.raceTimer == 0.0)
    {
        vars.accumulatedTime = 0.0; // Flushes old cup data for a fresh run
        return true;
    }
}

update
{
    // The exact frame a race ends, permanently commit its final time to our master total
    if (old.raceActive == 1 && current.raceActive == 0 && current.raceTimer > 0.0)
    {
        vars.accumulatedTime += current.raceTimer;
    }
}

split
{
    return old.raceActive == 1 && current.raceActive == 0 && current.raceTimer > 0.0;
}

gameTime
{
    // If actively racing, show the cumulative past tracks + the current race track progression
    if (current.raceActive == 1)
    {
        return TimeSpan.FromSeconds(vars.accumulatedTime + current.raceTimer);
    }
    
    // If in a loading screen, pause menu, or countdown, hold completely solid on the accumulated total
    return TimeSpan.FromSeconds(vars.accumulatedTime);
}

isLoading
{
    return true;
}