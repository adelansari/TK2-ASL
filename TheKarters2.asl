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
    vars.accumulatedTime = 0D;
    vars.justFinished = false;     // Local state cache
}

update
{
    // 1. Evaluate the finish line trigger exactly ONCE per memory tick
    vars.justFinished = (old.raceActive == 1 && current.raceActive == 0 && current.raceTimer > 0.0);

    // 2. If the state just flipped to finished, append the time to our master total
    if (vars.justFinished)
    {
        vars.accumulatedTime += current.raceTimer;
    }
}

start
{
    if (current.raceTimer > 0.0 && old.raceTimer == 0.0)
    {
        vars.accumulatedTime = 0D;
        return true;
    }
}

split
{
    return vars.justFinished;
}

gameTime
{
    // Dynamically render the UI clock based on active racing state
    if (current.raceActive == 1)
    {
        return TimeSpan.FromSeconds(vars.accumulatedTime + current.raceTimer);
    }
    
    return TimeSpan.FromSeconds(vars.accumulatedTime);
}

isLoading
{
    // Delegate all timing pauses to the gameTime block
    return true;
}