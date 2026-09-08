# Changelog:

## [1.0.2] - 2026-09-08
### Fixed
- Updated the base memory offset to restore autosplitter functionality following the latest game update.

## [1.0.1] - 2026-06-26
### Fixed
- Mid-Race Restart Reset Bug: Fixed an issue where manual track restarts mid-race would wipe your progress and reset the timer buffer to 0. The accumulator now accurately catches the final frame of aborted attempts and appends it to the running total.

## [1.0.0] - 2026-06-10
### Added
- IL2CPP Architecture Migration: Complete rewrite of the race timer and race status tracking logic to fully support the game's transition to the IL2CPP engine layer.
- High-Precision Memory Accumulator: Implemented a 64-bit double-precision accumulator to stitch together individual multi-track times for seamless, frame-accurate Cup IGT consistency.
- Zero-Overhead Performance Caching: Optimized core memory polling to evaluate layout transitions exactly once per engine tick, completely eliminating redundant CPU cycles.