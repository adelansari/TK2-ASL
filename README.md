# The Karters 2: Turbo Charged - LiveSplit AutoSplitter

An advanced, frame-perfect AutoSplitter script for **The Karters 2: Turbo Charged**. This script hooks directly into the game engine's memory space to handle all timer operations automatically.

## Features

* **Automatic Start:** The timer begins the exact millisecond the pre-race countdown.".
* **Precise Splitting:** Automatically triggers a split the exact frame you cross the finish line, working seamlessly for mid-cup transitions and final cup podium screens.
* **Direct Memory Timing Sync:** Reads the internal race timer directly from memory to completely eliminate millisecond drift caused by system latency or frame rate fluctuations.

## Setup Instructions

1. Open **LiveSplit**.
2. Right-click the layout and select **Edit Splits...**
3. Ensure the Game Name is set exactly to: `The Karters 2: Turbo Charged`.
4. Click the **Activate** button to pull the official script configuration.
5. **Crucial Step:** Right-click LiveSplit, go to **Compare Against**, and verify it is set to **Game Time**. If left on *Real Time*, the auto-pauses and exact memory sync hooks will not display correctly.

## Hardware & Framerate Compatibility

The script utilizes direct memory injection logic via the `gameTime` block. Because it pulls values directly from the game logic rather than calculating time based on CPU frame intervals, timing accuracy is 100% consistent across all hardware profiles—regardless of whether the game is running at 30 FPS, 60 FPS, or 300+ FPS.