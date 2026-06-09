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
    // Starts after the race countdown
    return current.raceTimer > 0.0 && old.raceTimer == 0.0;
}

split
{
    return old.raceActive == 1 && current.raceActive == 0 && current.raceTimer > 0.0;
}

gameTime
{
    // Directly injects the exact in-game memory float to eliminate millisecond drift
    if (current.raceActive == 0 && old.raceActive == 1)
    {
        return TimeSpan.FromSeconds(old.raceTimer);
    }
    return TimeSpan.FromSeconds(current.raceTimer);
}

isLoading
{
    // Hand over total clock management to the gameTime block
    return true;
}