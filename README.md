# Server Performance Stats Script

A lightweight Bash script (`server-stats.sh`) that provides a snapshot of the current system performance. It is designed to run on any standard Linux environment to quickly monitor resource usage and identify resource-heavy processes.

## Features

When executed, the script calculates and displays the following metrics:

1.  **Total CPU Usage**: Current CPU utilization percentage.
2.  **Total Memory Usage**: Free vs. Used RAM (including percentage used).
3.  **Total Disk Usage**: Free vs. Used disk space on the root file system (or total of all mounts).
4.  **Top 5 Processes by CPU**: The 5 processes currently consuming the most processing power.
5.  **Top 5 Processes by Memory**: The 5 processes currently consuming the most RAM.

## Prerequisites

* **OS**: Linux (Ubuntu, Debian, CentOS, RHEL, Fedora, etc.)
* **Shell**: Bash
* **Dependencies**: The script relies on standard system utilities found in almost all Linux distributions:
    * `vmstat`
    * `free`
    * `df`
    * `ps`
    * `awk`

## Installation

1.  **Download or Create the Script**
    Save the script code into a file named `server-stats.sh`.

2.  **Make it Executable**
    Run the following command in your terminal to give the script execution permissions:
    ```bash
    chmod +x server-stats.sh
    ```

## Usage

Run the script from your terminal:

```bash
./server-stats.sh