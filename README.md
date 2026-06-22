# FPGA-Based FFT IP Core using AXI Stream

## Introduction

This project implements an **FFT (Fast Fourier Transform) IP Core** using the AXI Stream interface in FPGA for real-time frequency domain analysis of complex signals. The FFT core processes complex-valued input data where each sample contains a real and imaginary part packed into a 32-bit AXI stream data word.The system includes a custom signal generator capable of generating different signal types such as single-tone, sinc, and rectangular waveforms. These signals are fed into the FFT IP core to validate the transform results.This project demonstrates practical FPGA-based FFT acceleration for DSP applications.

---

## Tools Used

- Verilog HDL

---

## Features

- Complex FFT processing
- AXI Stream based data transfer
- Supports variable FFT sizes
- 16-bit fixed-point implementation
- Multiple signal generation modes
- Automatic TLAST generation
- TVALID signal control
- Magnitude computation
- Real-time frequency analysis
- FPGA synthesizable design

---


---

## Block Design

The complete block design consists of:

<img width="1912" height="720" alt="image" src="https://github.com/user-attachments/assets/5908c1e3-f208-4f58-9464-e75f40226f36" />

---

## Simulated Results

<img width="1600" height="853" alt="image" src="https://github.com/user-attachments/assets/22707223-c35e-4cc5-b3ec-d1144286bf96" />

<img width="1600" height="849" alt="image" src="https://github.com/user-attachments/assets/460ec92a-1eb9-42cf-9da1-1ef54d9e6ec4" />


### Single Tone Signal

Time Domain:
- Pure sinusoidal waveform

FFT Result:
- Single peak in frequency domain

Observation:
Confirms correct FFT operation.

---

### Sinc Signal

Time Domain:
- Sinc waveform

FFT Result:
- Rectangular frequency spectrum

Observation:
Matches theoretical Fourier transform.

---

### Rectangular Signal

Time Domain:
- Rectangular waveform

FFT Result:
- Sinc function in frequency domain

Observation:
Validates FFT correctness.

---

### AXI Stream Signals

#### TVALID

- Indicates valid FFT data
- Helps determine FFT processing latency

#### TLAST

- Asserted every FFT size samples
- Marks packet boundary

Example:
For FFT size = 2048

TLAST = 1 every 2048 clock cycles.

---

## Conclusion

This project successfully implements an FFT IP Core using AXI Stream for real-time DSP processing on FPGA. The simulation results validate the Fourier transform behavior for multiple signal types, confirming correct implementation of the FFT architecture.The AXI Stream protocol handling using TVALID and TLAST ensures proper packetized data processing.This design provides a strong foundation for high-speed FPGA-based signal analysis.

---

## Scope

- Real-time spectrum analyzer
- OFDM communication systems
- Radar signal processing
- Biomedical signal analysis
- Audio frequency analysis
- SDR (Software Defined Radio)
- FFT acceleration using AXI DMA
- ARM + FPGA co-processing
- Zynq SoC integration
- Wireless communication systems
