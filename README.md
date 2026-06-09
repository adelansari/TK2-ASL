# The Karters 2: Turbo Charged - LiveSplit AutoSplitter

An advanced, high-precision AutoSplitter script for **The Karters 2: Turbo Charged**. This script hooks into the game's IL2CPP memory layer to sync LiveSplit cleanly with internal engine data.

## Features

* **Automatic Start:** The timer fires the exact frame the pre-race countdown ends.
* **Stitched Master IGT Tracking:** Automatically accumulates individual map times into a unified running total, fixing broken split segments and calculating total Cup In-Game Time (IGT) perfectly.
* **Clean Pausing:** Retains complete layout pausing during game menus, loading sequences, and pre-race countdown states without misfiring false splits.

## Configuration Requirements

1. Right-click LiveSplit and open **Edit Splits...**
2. Ensure your Game Name is set precisely to: `The Karters 2: Turbo Charged` and click **Activate**.
3. **Crucial:** Right-click LiveSplit, hover over **Compare Against**, and select **Game Time**. Because this script overrides the layout timeline with raw memory ticks to prevent frame-drift, it will not display properly if left on *Real Time*.