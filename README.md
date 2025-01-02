
# CounterScripts

This repository contains Lua scripts for managing counters in an AzerothCore-based World of Warcraft server. These scripts implement a basic counter system using a Singleton pattern and provide functionality to manage multiple named counters. 

## Features

- **Global Counter**: A single, global counter that can be incremented, reset, and its value retrieved.
- **Named Counters**: Support for multiple counters with unique names, allowing:
  - Adding new counters.
  - Incrementing specific counters.
  - Retrieving the value of a specific counter.
  - Resetting a specific counter.

## How It Works

The script uses the **Singleton pattern**, ensuring there is only one instance of the `Counter` object during the runtime of the server. This allows the counters to be shared across all scripts interacting with it.

## Key Points

- **Controller**: The core logic of the counter system resides in the `CounterController.lua`.
- **Model**: The data and state management are handled within the model script, encapsulating the counter values.
- **View**: The `CounterView.lua` displays counter information to the players, for example, sending messages in the chat on player login.

## Limitations

⚠️ **This script does not handle data persistence.**
- The counter values are stored only in memory.
- When the server restarts, all counter values are reset.

## Usage

### Global Counter

1. **Increment the global counter**:
   ```lua
   local counter = Counter:GetInstance()
   counter:Increment()
   ```
2. **Retrieve the value of the global counter**:
   ```lua
   local value = counter:GetValue()
   print("Global Counter Value:", value)
   ```
3. **Reset the global counter**:
   ```lua
   counter:Reset()
   ```

### Named Counters

1. **Add a new named counter**:
   ```lua
   counter:AddCounter("MyCounter")
   ```
2. **Increment a specific counter**:
   ```lua
   counter:IncrementCounter("MyCounter")
   ```
3. **Retrieve the value of a specific counter**:
   ```lua
   local value = counter:GetCounterValue("MyCounter")
   print("Value of MyCounter:", value)
   ```
4. **Reset a specific counter**:
   ```lua
   counter:ResetCounter("MyCounter")
   ```

## Installation

1. Place the scripts in the appropriate folder in your AzerothCore server directory.
2. Ensure the scripts are correctly loaded by the server.
3. Restart your server to initialize the scripts.

## Contributing

Feel free to fork this repository and submit pull requests if you have improvements or additional features.

---

### Disclaimer

These scripts are provided as-is. Use them at your own risk.
